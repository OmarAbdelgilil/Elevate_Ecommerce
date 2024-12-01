import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_categories_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/category_screen/categry_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categry_viewmodel_test.mocks.dart';

@GenerateMocks([GetCategoriesUsecase])
void main() {
  late CategoriesViewmodel categoriesViewmodel;
  late MockGetCategoriesUsecase mockGetCategoriesUsecase;

  final dummyCategories = Categories(categories: [
    CategoryModel(
        id: '1', name: 'Category 1', slug: 'cat-1', image: 'image1.png'),
    CategoryModel(
        id: '2', name: 'Category 2', slug: 'cat-2', image: 'image2.png'),
  ]);

  setUp(() {
    mockGetCategoriesUsecase = MockGetCategoriesUsecase();
    categoriesViewmodel = CategoriesViewmodel(mockGetCategoriesUsecase);
    provideDummy<Result<Categories?>>(
      Fail<Categories?>(Exception("Dummy exception")),
    );
  });

  group('CategoriesViewmodel test', () {
    test('initial state is InitialState', () {
      expect(categoriesViewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with LoadCategoriesIntent emits LoadingState, SuccessState on Success',
      () async {
        final successResult = Success(dummyCategories);

        when(mockGetCategoriesUsecase.getCategories())
            .thenAnswer((_) async => successResult);

        expectLater(
          categoriesViewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessState>(),
          ]),
        );

        categoriesViewmodel.doIntent(LoadCategoriesIntent());
      },
    );

    test(
      'doIntent with LoadCategoriesIntent emits LoadingState, ErrorState on Fail',
      () async {
        final exception = Exception('Failed to load categories');

        final failResult = Fail<Categories?>(exception);

        when(mockGetCategoriesUsecase.getCategories())
            .thenAnswer((_) async => failResult);

        expectLater(
          categoriesViewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<ErrorState>(),
          ]),
        );

        categoriesViewmodel.doIntent(LoadCategoriesIntent());
      },
    );
  });
}
