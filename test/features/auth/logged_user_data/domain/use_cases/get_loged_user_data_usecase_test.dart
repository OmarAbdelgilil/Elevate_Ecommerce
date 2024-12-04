import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_loged_user_data_usecase_test.mocks.dart';

@GenerateMocks([GetLoggedUserDataRepo])
void main() {
  late GetLogedUserDataUsecase getLogedUserDataUsecase;
  late MockGetLoggedUserDataRepo mockGetLoggedUserDataRepo;

  final userResponse = UserResponse(
    message: 'Success',
    user: UserData(id: '123', firstName: 'John', lastName: 'Doe'),
  );

  setUp(() {
    mockGetLoggedUserDataRepo = MockGetLoggedUserDataRepo();
    getLogedUserDataUsecase =
        GetLogedUserDataUsecase(mockGetLoggedUserDataRepo);

    provideDummy<Result<UserResponse?>>(
      Fail<UserResponse?>(Exception('Dummy exception')),
    );
  });

  group('getLogedUserData', () {
    test('returns user data when repository call is successful', () async {
      when(mockGetLoggedUserDataRepo.getLoggedUserData())
          .thenAnswer((_) async => Success<UserResponse?>(userResponse));

      // Act: Call the use case
      final result = await getLogedUserDataUsecase.getLogedUserData();

      expect(result, isA<Success<UserResponse?>>());
      expect((result as Success<UserResponse?>).data?.message, 'Success');
      verify(mockGetLoggedUserDataRepo.getLoggedUserData()).called(1);
    });

    test('returns failure when repository call fails', () async {
      final exception = Exception('Failed to get user data');
      when(mockGetLoggedUserDataRepo.getLoggedUserData())
          .thenAnswer((_) async => Fail<UserResponse?>(exception));

      final result = await getLogedUserDataUsecase.getLogedUserData();

      expect(result, isA<Fail<UserResponse?>>());
      expect((result as Fail<UserResponse?>).exception, exception);
      verify(mockGetLoggedUserDataRepo.getLoggedUserData()).called(1);
    });
  });
}
