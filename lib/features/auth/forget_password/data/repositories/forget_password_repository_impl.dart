import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/contracts/forget_password_online_datasource.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/domain/repositories/forget_password_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final ForgetPasswordOnlineDatasource _forgetPasswordOnlineDatasource;
  ForgetPasswordRepositoryImpl(this._forgetPasswordOnlineDatasource);

  @override
  Future<Result<ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request) async {
    return await _forgetPasswordOnlineDatasource.forgotPassword(request);
  }

  @override
  Future<Result<VerifyPasswordResponse>> verifyResetPassword(
      VerifyPasswordRequest resetCode) async {
    return await _forgetPasswordOnlineDatasource.verifyResetPassword(resetCode);
  }

  @override
  Future<Result<User?>> resetPassword(ResetPasswordRequest request) async {
    return await _forgetPasswordOnlineDatasource.resetPassword(request);
  }
}
