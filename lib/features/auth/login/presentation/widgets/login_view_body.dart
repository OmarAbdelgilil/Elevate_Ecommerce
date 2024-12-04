import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator_types.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/guest_button.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/remember_me_button.dart';
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
            hint: StringsManager.emailFieldHint,
            label: StringsManager.emailFieldLabel,
            controller: loginValidator.emailController,
            validator: loginValidator.validate(LoginValidatorTypes.email),
          ),
          const SizedBox(height: 24),
          CustomTextField(
            obscureText: true,
            hint: StringsManager.hintPassword,
            label: StringsManager.passwordFieldLabel,
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
                child: const Text(
                  'Forget password?',
                  style: TextStyle(
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
              text: 'Login',
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
              const Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.register),
                child: Text(
                  'Sign up',
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
