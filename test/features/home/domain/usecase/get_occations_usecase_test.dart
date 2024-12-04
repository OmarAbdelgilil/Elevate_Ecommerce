import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_occations_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_categories_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetOccasionsUsecase getOccationsUsecase;
  late MockHomeRepository mockHomeRepository;

  final dummyOccasions = Occasions(occasions: [
    OccasionModel(id: '1', name: 'Test occation'),
  ]);

  setUp(() {
    mockHomeRepository = MockHomeRepository();
    getOccationsUsecase = GetOccasionsUsecase(mockHomeRepository);

    provideDummy<Result<Occasions?>>(Success(dummyOccasions));
  });

  group('GetOccasionsUsecase Tests', () {
    test('getOccations returns Success', () async {
      final successResult = Success(dummyOccasions);

      when(mockHomeRepository.getAllOccasions())
          .thenAnswer((_) async => successResult);

      final actual = await getOccationsUsecase.getAllOccasions();

      expect(actual, successResult);
      verify(mockHomeRepository.getAllOccasions()).called(1);
    });

    test('getOccations returns Fail when repository fails', () async {
      final exception = Exception('Failed to get Occations');
      final failResult = Fail<Occasions?>(exception);

      when(mockHomeRepository.getAllOccasions())
          .thenAnswer((_) async => failResult);

      final actual = await getOccationsUsecase.getAllOccasions();

      expect(actual, failResult);
      verify(mockHomeRepository.getAllOccasions()).called(1);
    });
  });
}
