import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:elevate_ecommerce/utils/token_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;

  LoginViewModel(this.loginUsecase) : super(InitialState());
  final TokenStorage _tokenStorage = TokenStorage();
  void handleIntent(LoginScreenIntent intent) {
    switch (intent) {
      case LoginIntent _:
        _handleLogin(intent);
      default:
        throw UnsupportedError("Unsupported intent: $intent");
    }
  }

  Future<void> _handleLogin(LoginIntent intent) async {
    emit(LoadingState());
    try {
      final loginRequest =
          LoginRequest(email: intent.email, password: intent.password);

      final result = await loginUsecase.login(loginRequest);

      if (result is Success<LoginResponse>) {
        if (intent.rememberMe) {
          await _tokenStorage.saveToken(result.data!.token!);
        }

        emit(SuccessState(result.data));
      } else if (result is Fail<LoginResponse>) {
        emit(ErrorState(result.exception));
      } else {
        emit(ErrorState(Exception("Unknown result type")));
      }
    } catch (e) {
      print("Login error: $e");
      emit(ErrorState(e as Exception?));
    }
  }
}

sealed class LoginScreenIntent {}

final class LoginIntent extends LoginScreenIntent {
  final String email;
  final String password;
  final bool rememberMe;

  LoginIntent(
      {required this.email, required this.password, required this.rememberMe});
}

sealed class LoginState {}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LoginState {
  LoginResponse? loginResponse;
  SuccessState(this.loginResponse);
}
