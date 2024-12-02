import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/home/domain/models/HomeModels/home.dart';
import 'package:elevate_ecommerce/features/home/domain/usecases/get_homepage_usecase.dart';
import 'package:elevate_ecommerce/features/home/presentation/home_screen/home_screen_view_models/home_screen_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_screen_viewmodel_test.mocks.dart';

@GenerateMocks([GetHomepageUsecase])
void main() {
  late HomeScreenViewmodel viewmodel;
  late MockGetHomepageUsecase mockGetHomepageUsecase;

  setUp(() {
    mockGetHomepageUsecase = MockGetHomepageUsecase();
    viewmodel = HomeScreenViewmodel(mockGetHomepageUsecase);
  });

  group('HomeScreenViewmodel test', () {
    test('initial state is InitialState', () {
      expect(viewmodel.state, isA<InitialState>());
    });

    test(
      'doIntent with LoadHomeIntent emits LoadingState, SuccessState on Success',
      () async {
        final homeData = Home(); // Create a dummy instance of `Home`
        provideDummy<Result<Home?>>(
          Success<Home?>(homeData),
        );

        when(mockGetHomepageUsecase.getHomePage())
            .thenAnswer((_) async => Success<Home?>(homeData));

        expectLater(
          viewmodel.stream,
          emitsInOrder([
            isA<LoadingState>(),
            isA<SuccessState>().having(
              (state) => state.homeData,
              'homeData',
              equals(homeData),
            ),
          ]),
        );

        viewmodel.doIntent(LoadHomeIntent());
      },
    );

    test(
      'doIntent with LoadHomeIntent emits LoadingState, ErrorState on Fail',
      () async {
        final exception = Exception('Failed to load home data');
        provideDummy<Result<Home?>>(
          Fail<Home?>(exception),
        );

        when(mockGetHomepageUsecase.getHomePage())
            .thenAnswer((_) async => Fail<Home?>(exception));

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

        viewmodel.doIntent(LoadHomeIntent());
      },
    );
  });
}
