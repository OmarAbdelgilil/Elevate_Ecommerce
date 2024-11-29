import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasion.dart';
import 'package:elevate_ecommerce/features/home/domain/models/occasions.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/get_occations_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/occasions/occasions_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'occasions_viewmodel_test.mocks.dart';

@GenerateMocks([GetOccasionsUsecase])
void main() {
  late OccasionsViewmodel occasionsViewmodel;
  late MockGetOccasionsUsecase mockGetOccasionsUsecase;

  final dummyOccasions = Occasions(occasions: [
    OccasionModel(
        id: '1', name: 'Occasion 1', slug: 'occ-1', image: 'image1.png'),
    OccasionModel(
        id: '2', name: 'Occasion 2', slug: 'occ-2', image: 'image2.png'),
  ]);

  setUp(() {
    mockGetOccasionsUsecase = MockGetOccasionsUsecase();
    occasionsViewmodel = OccasionsViewmodel(mockGetOccasionsUsecase);
    provideDummy<Result<Occasions?>>(
      Fail<Occasions?>(Exception("Dummy exception")),
    );
  });

  group('OccasionsViewmodel test', () {
    test('initial state is InitialState', () {
      expect(occasionsViewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with LoadOccasionsIntent emits LoadingState, SuccessOccasionsState on Success',
      () async {
        final successResult = Success(dummyOccasions);

        when(mockGetOccasionsUsecase.getAllOccasions())
            .thenAnswer((_) async => successResult);

        expectLater(
          occasionsViewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessOccasionsState>(),
          ]),
        );

        occasionsViewmodel.doIntent(LoadOccationsIntent());
      },
    );

    test(
      'doIntent with LoadOccasionsIntent emits LoadingState, ErrorState on Fail',
      () async {
        final exception = Exception('Failed to load occasions');

        final failResult = Fail<Occasions?>(exception);

        when(mockGetOccasionsUsecase.getAllOccasions())
            .thenAnswer((_) async => failResult);

        expectLater(
          occasionsViewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<ErrorState>(),
          ]),
        );

        occasionsViewmodel.doIntent(LoadOccationsIntent());
      },
    );
  });
}
