import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_screen_view_models/categories_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'categories_viewmodel_test.mocks.dart';

@GenerateMocks([GetCategoriesUsecase])
void main() {
  late CategoriesViewmodel viewmodel;
  late MockGetCategoriesUsecase mockGetCategoriesUsecase;

  setUp(() {
    mockGetCategoriesUsecase = MockGetCategoriesUsecase();
    viewmodel = CategoriesViewmodel(mockGetCategoriesUsecase);
  });

  group('CategoriesViewmodel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with LoadCategoriesIntent emits LoadingState, SuccessState on Success',
      () async {
        final categoriesList = [
          CategoryModel(id: '1', name: 'Category 1'),
          CategoryModel(id: '2', name: 'Category 2'),
        ];
        final categories = Categories(categories: categoriesList);

        provideDummy<Result<Categories?>>(
          Success<Categories?>(categories),
        );

        when(mockGetCategoriesUsecase.getCategories())
            .thenAnswer((_) async => Success<Categories?>(categories));

        expectLater(
          viewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessState>().having(
              (state) => state.categories,
              'categories',
              equals(categoriesList),
            ),
          ]),
        );

        viewmodel.doIntent(LoadCategoriesIntent());
      },
    );

    test(
      'doIntent with LoadCategoriesIntent emits LoadingState, ErrorState on Fail',
      () async {
        final exception = Exception('Failed to load categories');

        provideDummy<Result<Categories?>>(
          Fail<Categories?>(exception),
        );

        when(mockGetCategoriesUsecase.getCategories())
            .thenAnswer((_) async => Fail<Categories?>(exception));

        expectLater(
          viewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<ErrorState>().having(
              (state) => state.exception,
              'exception',
              equals(exception),
            ),
          ]),
        );

        viewmodel.doIntent(LoadCategoriesIntent());
      },
    );
  });
}
