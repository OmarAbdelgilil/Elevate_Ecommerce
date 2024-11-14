import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
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
              'Reset password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least ',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp)),
            SizedBox(
              height: 30.h,
            ),
            CustomtextField(
              hint: 'Enter your password',
              lable: 'New password',
              controller: passwordController,
              validator: passwordValidator,
              errorText: exception != null ? 'Password is invalid ' : null,
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomtextField(
              hint: 'Confirm password',
              lable: 'Confirm password',
              controller: confirmPasswordController,
              validator: confirmPasswordValidator,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: 'Confirm',
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
