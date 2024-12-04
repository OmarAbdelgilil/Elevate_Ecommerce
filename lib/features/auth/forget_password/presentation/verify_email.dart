import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
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
              StringsManager.verifyEmailScreenTitle,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                StringsManager.verifyEmailScreenEmailGuide,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp)),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              hint: StringsManager.emailFieldHint,
              controller: emailController,
              validator: emailValidator,
              label: StringsManager.emailFieldLabel,
              errorText:
                  exception != null ? StringsManager.emailFieldError : null,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: StringsManager.continueButtonText,
              color: primaryColor,
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
