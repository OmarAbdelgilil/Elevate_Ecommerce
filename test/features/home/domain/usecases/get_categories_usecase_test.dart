import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/categories.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetCategoriesUsecase getCategoriesUsecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getCategoriesUsecase = GetCategoriesUsecase(mockHomeRepository);

    provideDummy<Result<Categories?>>(Success(Categories()));
    provideDummy<Result<Categories?>>(Fail(Exception()));
  });

  group('GetCategoriesUsecase Tests', () {
    test('getCategories calls getAllCategories on HomeRepository', () async {
      final successResult = Success(Categories());
      when(mockHomeRepository.getAllCategories())
          .thenAnswer((_) async => successResult);

      final result = await getCategoriesUsecase.getCategories();

      expect(result, successResult);
      verify(mockHomeRepository.getAllCategories()).called(1);
    });

    test('getCategories returns Fail when HomeRepository fails', () async {
      final exception = Exception('Failed to fetch categories');
      final failResult = Fail<Categories?>(exception);

      when(mockHomeRepository.getAllCategories())
          .thenAnswer((_) async => failResult);

      final result = await getCategoriesUsecase.getCategories();

      expect(result, failResult);
      verify(mockHomeRepository.getAllCategories()).called(1);
    });
  });
}
