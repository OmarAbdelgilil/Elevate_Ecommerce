import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/repository/register_repository.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/useCases/register_useCase.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/update_user_data_requeset.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/home/domain/repositories/home_repository.dart';
import 'package:elevate_ecommerce/features/home/domain/usecase/update_user_data_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_user_data_usecase_test.mocks.dart';


@GenerateMocks([HomeRepository])
void main() {

  test('when call invoke it should call RegisterRepository.register with correct parameter', () async {
    // Arrange
    var mockedResult = Success<UserResponse?>(UserResponse());
    provideDummy<Result<UserResponse?>>(mockedResult);
    var updateDataUser = MockHomeRepository();
    var updateDataUseCase = UpdateUserDataUseCase(updateDataUser);
    final request = UpdateProfileRequest(firstName: 'abdalla', lastName: 'eldaly', email: 'daly@gmail.com', phone: '+201012951616');

    when(updateDataUser.upDateUserProfile(any)).thenAnswer((_)async=>mockedResult);
    // Act
    var actual= await updateDataUseCase.getUpdateUserData(request);

    // Assert
    expect(actual, mockedResult);
    verify(updateDataUser.upDateUserProfile(request)).called(1);
  });
}

