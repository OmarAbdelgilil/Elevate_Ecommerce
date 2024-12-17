import 'package:elevate_ecommerce/features/auth/login/domain/repos/login_repo.dart';
import 'package:elevate_ecommerce/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([LoginRepo])
void main() {
  late MockLoginRepo mockLoginRepo;
  late LoginUsecase loginUsecase;
  final loginRequest = LoginRequest(email: 'test@example.com', password: 'password');
  final loginResponse = LoginResponse(message: 'Success', token: 'fake_token');

  setUp(() {
    mockLoginRepo = MockLoginRepo();
    loginUsecase = LoginUsecase(mockLoginRepo);
  });

  test('should return Success when login is successful', () async {
    when(mockLoginRepo.login(loginRequest)).thenAnswer(
          (_) async => Success(loginResponse), // Ensure that a dummy result is provided here
    );

    final result = await loginUsecase.login(loginRequest);

    expect(result, isA<Success<LoginResponse>>());
    expect((result as Success<LoginResponse>).data?.message, 'Success');
    expect(result.data?.token, 'fake_token');
  });

  test('should return Fail when login fails', () async {
    final loginRequest = LoginRequest(email: 'wrong@example.com', password: 'wrong_password');
    final exception = Exception('Login failed');

    when(mockLoginRepo.login(loginRequest)).thenAnswer(
          (_) async => Fail(exception), // Provide a dummy failure result here
    );

    final result = await loginUsecase.login(loginRequest);

    expect(result, isA<Fail<LoginResponse>>());
    expect((result as Fail<LoginResponse>).exception?.toString(), 'Exception: Login failed');
  });

  test('should handle empty email and password gracefully', () async {
    final loginRequest = LoginRequest(email: '', password: '');

    when(mockLoginRepo.login(loginRequest)).thenAnswer(
          (_) async => Fail(Exception('Email or password cannot be empty')),
    );

    final result = await loginUsecase.login(loginRequest);

    expect(result, isA<Fail<LoginResponse>>());
    expect((result as Fail<LoginResponse>).exception?.toString(), 'Exception: Email or password cannot be empty');
  });

  test('should handle network failure', () async {
    // Arrange: Simulate a network failure scenario
    final loginRequest = LoginRequest(email: 'test@example.com', password: 'password');
    final exception = Exception('Network Error');

    // Mock the login method of LoginRepo to simulate network failure
    when(mockLoginRepo.login(loginRequest)).thenAnswer(
          (_) async => Fail(exception),
    );

    // Act: Call the login method of LoginUsecase
    final result = await loginUsecase.login(loginRequest);

    // Assert: Check that the result is a Fail with the expected network exception
    expect(result, isA<Fail<LoginResponse>>());
    expect((result as Fail<LoginResponse>).exception?.toString(), 'Exception: Network Error');
  });
}
