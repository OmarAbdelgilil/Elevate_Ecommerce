import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/repos/get_logged_user_data_repo.dart';
import 'package:elevate_ecommerce/features/auth/logout/data/models/logout_response.dart';
import 'package:elevate_ecommerce/features/auth/logout/domain/repos/logout_repo.dart';
import 'package:elevate_ecommerce/features/auth/logout/domain/use_cases/logout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logout_usecase_test.mocks.dart';

@GenerateMocks([LogoutRepo])
void main() {
  late LogoutUsecase logoutUsecase;
  late MockLogoutRepo mockGetLoggedUserDataRepo;

  final userResponse = Logout(
    message: 'Success',
  );

  setUp(() {
    mockGetLoggedUserDataRepo = MockLogoutRepo();
    logoutUsecase = LogoutUsecase(mockGetLoggedUserDataRepo);

    provideDummy<Result<Logout?>>(
      Fail<Logout?>(Exception('Dummy exception')),
    );
  });

  group('getLogedUserData', () {
    test('returns user data when repository call is successful', () async {
      when(mockGetLoggedUserDataRepo.logout())
          .thenAnswer((_) async => Success<Logout?>(userResponse));

      // Act: Call the use case
      final result = await logoutUsecase.logout();

      expect(result, isA<Success<Logout?>>());
      expect((result as Success<Logout?>).data?.message, 'Success');
      verify(mockGetLoggedUserDataRepo.logout()).called(1);
    });
  });
}
