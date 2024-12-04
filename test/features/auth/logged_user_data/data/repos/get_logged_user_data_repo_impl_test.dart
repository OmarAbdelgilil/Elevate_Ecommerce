import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/contracts/get_logged_user_data_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/repos/get_logged_user_data_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_logged_user_data_repo_impl_test.mocks.dart';

@GenerateMocks([GetLoggedUserDataOnlineDatasource])
void main() {
  late GetLoggedUserDataRepoImpl getLoggedUserDataRepo;
  late MockGetLoggedUserDataOnlineDatasource mockDatasource;

  final userResponse = UserResponse(
    message: 'Success',
    user: UserData(id: '123', firstName: 'John', lastName: 'Doe'),
  );

  setUp(() {
    mockDatasource = MockGetLoggedUserDataOnlineDatasource();
    getLoggedUserDataRepo = GetLoggedUserDataRepoImpl(mockDatasource);

    provideDummy<Result<UserResponse?>>(
      Fail<UserResponse?>(Exception('Dummy exception')),
    );
  });

  group('getLoggedUserData', () {
    test('returns user data when the call to datasource is successful',
        () async {
      when<Future<Result<UserResponse?>>>(
        mockDatasource.getLoggedUserData(),
      ).thenAnswer((_) async => Success<UserResponse?>(userResponse));

      final result = await getLoggedUserDataRepo.getLoggedUserData();

      expect(result, isA<Success<UserResponse?>>());
      expect((result as Success<UserResponse?>).data?.message, 'Success');
      verify(mockDatasource.getLoggedUserData()).called(1);
    });

    test('returns failure when the call to datasource fails', () async {
      final exception = Exception('Failed to get user data');
      when(mockDatasource.getLoggedUserData())
          .thenAnswer((_) async => Fail<UserResponse?>(exception));

      final result = await getLoggedUserDataRepo.getLoggedUserData();

      expect(result, isA<Fail<UserResponse?>>());
      expect((result as Fail<UserResponse?>).exception, exception);
      verify(mockDatasource.getLoggedUserData()).called(1);
    });
  });
}
