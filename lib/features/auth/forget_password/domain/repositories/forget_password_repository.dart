import 'package:elevate_ecommerce/core/common/api_result.dart';
import 'package:elevate_ecommerce/features/auth/domain/model/user.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/forgot_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/reset_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/requests/verify_password_request.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/forgot_password_response.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/data/models/responses/verify_password_response.dart';

abstract class ForgetPasswordRepository {
  Future<Result<ForgotPasswordResponse>> forgotPassword(
      ForgotPasswordRequest request);
  Future<Result<VerifyPasswordResponse>> verifyResetPassword(
      VerifyPasswordRequest resetCode);
  Future<Result<User?>> resetPassword(ResetPasswordRequest request);
}
