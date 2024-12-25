import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/request.dart';
import 'package:elevate_ecommerce/features/auth/Register/data/model/response.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/repository/register_repository.dart';
import 'package:elevate_ecommerce/features/auth/Register/domain/useCases/register_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_useCase_test.mocks.dart';

@GenerateMocks([RegisterRepository])
void main() {
  test(
      'when call invoke it should call RegisterRepository.register with correct parameter',
      () async {
    // Arrange
    var mockedResult = Success<RegisterResponse?>(RegisterResponse());
    provideDummy<Result<RegisterResponse?>>(mockedResult);
    var registerRepo = MockRegisterRepository();
    var registerUseCase = RegisterUseCase(registerRepo);
    final request = RegisterRequest();

    when(registerRepo.register(any)).thenAnswer((_) async => mockedResult);
    // Act
    var actual = await registerUseCase.register(request);

    // Assert
    expect(actual, mockedResult);
    verify(registerRepo.register(request)).called(1);
  });
}
