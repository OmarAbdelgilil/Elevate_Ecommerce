import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/models/category.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetCategoriesUsecase getCategoriesUsecase;
  late MockHomeRepository mockHomeRepository;

  final dummyCategories = Categories(categories: [
    CategoryModel(id: '1', name: 'Test Category'),
  ]);

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCategoriesUsecase = GetCategoriesUsecase(mockHomeRepository);

    // Provide a dummy value for Result<Categories?>
    provideDummy<Result<Categories?>>(Success(dummyCategories));
  });

  group('GetCategoriesUsecase Tests', () {
    test('getCategories returns Success', () async {
      final successResult = Success(dummyCategories);

      when(mockHomeRepository.getAllCategories())
          .thenAnswer((_) async => successResult);

      final actual = await getCategoriesUsecase.getCategories();

      expect(actual, successResult);
      verify(mockHomeRepository.getAllCategories()).called(1);
    });

    test('getCategories returns Fail when repository fails', () async {
      final exception = Exception('Failed to get categories');
      final failResult = Fail<Categories?>(exception);

      when(mockHomeRepository.getAllCategories())
          .thenAnswer((_) async => failResult);

      final actual = await getCategoriesUsecase.getCategories();

      expect(actual, failResult);
      verify(mockHomeRepository.getAllCategories()).called(1);
    });
  });
}
