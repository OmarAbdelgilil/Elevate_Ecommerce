import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator_types.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/guest_button.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/remember_me_button.dart';
import 'package:elevate_ecommerce/features/home/presentation/profile_screen/profile_view/profile__screen.dart';
import 'package:elevate_ecommerce/utils/color_manager.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final loginValidator = LoginValidator();
  final ValueNotifier<bool> rememberMeNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return buildLoginForm(context);
  }

  Widget buildLoginForm(BuildContext context) {
    return Form(
      key: loginValidator.loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          CustomTextField(
            hint: StringsManager.emailFieldHint.tr(),
            label: StringsManager.emailFieldLabel.tr(),
            controller: loginValidator.emailController,
            validator: loginValidator.validate(LoginValidatorTypes.email),
          ),
          const SizedBox(height: 24),
          CustomTextField(
            obscureText: true,
            hint: StringsManager.hintPassword.tr(),
            label: StringsManager.passwordFieldLabel.tr(),
            controller: loginValidator.passwordController,
            validator: loginValidator.validate(LoginValidatorTypes.password),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RememberMeCheckbox(notifier: rememberMeNotifier),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.forgetPassword),
                child: Text(
                  StringsManager.forgetpassword.tr(),
                  style: const TextStyle(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BlocBuilder<LoginViewModel, LoginState>(builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              );
            }
            return CustomButton(
              text: StringsManager.login.tr(),
              onPressed: () {
                if (loginValidator.loginFormKey.currentState?.validate() ??
                    false) {
                  final rememberMeState = rememberMeNotifier.value;
                  print("Remember Me checkbox state: $rememberMeState");

                  context.read<LoginViewModel>().handleIntent(
                        LoginIntent(
                          email: loginValidator.emailController.text,
                          password: loginValidator.passwordController.text,
                          rememberMe: rememberMeState,
                        ),
                      );
                }
              },
            );
          }),
          const SizedBox(height: 16),
          GuestButton(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringsManager.donthaveaccount.tr(),
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.register),
                child: Text(
                  StringsManager.signUp.tr(),
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    decorationColor: primaryColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
