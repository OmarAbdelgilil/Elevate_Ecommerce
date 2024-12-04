import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyPassword extends StatelessWidget {
  final Exception? exception;
  final void Function(String password) resetPassword;
  final GlobalKey<FormState> passwordFormKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String? Function(String?) passwordValidator;
  final String? Function(String?) confirmPasswordValidator;
  const VerifyPassword({
    super.key,
    this.exception,
    required this.resetPassword,
    required this.passwordFormKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordValidator,
    required this.confirmPasswordValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: passwordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringsManager.resetPassScreenTitle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                StringsManager.resetPassScreenGuide,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp)),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              hint: StringsManager.hintPassword,
              label: StringsManager.newPasswordLabel,
              controller: passwordController,
              validator: passwordValidator,
              errorText:
                  exception != null ? StringsManager.passwordFieldError : null,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextField(
              hint: StringsManager.confirmPasswordHint,
              label: StringsManager.confirmPasswordHint,
              controller: confirmPasswordController,
              validator: confirmPasswordValidator,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: StringsManager.confirmButtonText,
              onPressed: () {
                if (passwordFormKey.currentState!.validate()) {
                  resetPassword(passwordController.text);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
