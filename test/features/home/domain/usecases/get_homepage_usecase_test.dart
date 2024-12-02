import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_homepage_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_homepage_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetHomepageUsecase getHomepageUsecase;
  late MockHomeRepository mockHomeRepository;

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getHomepageUsecase = GetHomepageUsecase(mockHomeRepository);

    provideDummy<Result<Home?>>(Success(Home()));
    provideDummy<Result<Home?>>(Fail(Exception()));
  });

  group('GetHomepageUsecase Tests', () {
    test('getHomePage calls getHomePage on HomeRepository', () async {
      final successResult = Success(Home());
      when(mockHomeRepository.getHomePage())
          .thenAnswer((_) async => successResult);

      final result = await getHomepageUsecase.getHomePage();

      expect(result, successResult);
      verify(mockHomeRepository.getHomePage()).called(1);
    });

    test('getHomePage returns Fail when HomeRepository fails', () async {
      final exception = Exception('Failed to fetch homepage data');
      final failResult = Fail<Home?>(exception);

      when(mockHomeRepository.getHomePage())
          .thenAnswer((_) async => failResult);

      final result = await getHomepageUsecase.getHomePage();

      expect(result, failResult);
      verify(mockHomeRepository.getHomePage()).called(1);
    });
  });
}
