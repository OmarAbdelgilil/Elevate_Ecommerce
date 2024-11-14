import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmail extends StatelessWidget {
  final Exception? exception;
  final Function(String email) sendOtp;
  final TextEditingController emailController;
  final String? Function(String?) emailValidator;
  final GlobalKey<FormState> formKey;
  const VerifyEmail(
      {super.key,
      required this.emailController,
      required this.emailValidator,
      required this.sendOtp,
      required this.formKey,
      this.exception});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Forget password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                'Please enter your email associated to\nyour account',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp)),
            SizedBox(
              height: 30.h,
            ),
            CustomtextField(
              hint: 'Enter your email',
              controller: emailController,
              validator: emailValidator,
              lable: 'Email',
              errorText: exception != null ? 'This Email is invalid ' : null,
            ),
            SizedBox(
              height: 50.h,
            ),
            AppButton(
              text: const Text(
                'Continune',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                sendOtp(emailController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
