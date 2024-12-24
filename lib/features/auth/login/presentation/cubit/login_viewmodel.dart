import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce/core/cache/hive_service.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/core/providers/user_provider.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_model.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user_response.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/domain/use_cases/get_loged_user_data_usecase.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/request/login_request.dart';
import 'package:elevate_ecommerce/features/auth/login/data/models/response/login_response.dart';
import 'package:elevate_ecommerce/features/auth/login/domain/use_cases/login_usecase.dart';
import 'package:elevate_ecommerce/utils/token_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/api_result.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;
  final GetLogedUserDataUsecase getLogedUserDataUsecase;

  LoginViewModel(this.loginUsecase, this.getLogedUserDataUsecase)
      : super(InitialState());

  final TokenStorage _tokenStorage = TokenStorage();

  Future<void> handleIntent(LoginScreenIntent intent) async {
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
        if (intent.rememberMe == true) {
          await _tokenStorage.saveToken(result.data!.token!);
          final cashedToken = await _tokenStorage.getToken();
          TokenProvider().saveToken(cashedToken!);
          final userDataResult =
              await getLogedUserDataUsecase.getLogedUserData();
          if (userDataResult is Success<UserResponse?> &&
              userDataResult.data != null) {
            final userData = userDataResult.data!.user!;
            final userJson = userData.toJson();
            print('Raw user JSON: $userJson');
            final userModel = UserModel.fromJson(userJson);
            print('Mapped UserModel: ${userModel.toJson()}');
            final hiveService = HiveService();
            final token = result.data!.token!;
            await hiveService.saveUser(cashedToken, userModel);
            final cachedUser = await hiveService.getUser(cashedToken);

            UserProvider().setUserData(userData);

            print('user added to provider');

            print('Cached user for token $token: ${cachedUser?.toJson()}');
          } else {
            print('Failed to fetch user data or user data is null');
          }
        } else if (intent.rememberMe == false) {
          TokenProvider().saveToken(result.data!.token!);
          print('Token saved: ${TokenProvider().token}');
          final userDataResult =
              await getLogedUserDataUsecase.getLogedUserData();
          if (userDataResult is Success<UserResponse?> &&
              userDataResult.data != null) {
            final userData = userDataResult.data!.user!;

            await UserProvider().setUserData(userData);
            var userDatatest = UserProvider().userData;
            print(
                'User data saved in provider test : ${userDatatest?.toJson()}');
            print('User data saved in provider: ${userData.toJson()}');
          }
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
