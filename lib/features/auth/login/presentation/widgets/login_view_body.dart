import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/login_validator/login_validator_types.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/guest_button.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/remember_me_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final loginValidator = LoginValidator();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginViewModel, LoginState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuccessState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.home,
            );
          });
          return const SizedBox();
        }
        if (state is ErrorState) {
          var message = (state.exception);
          return Center(
            child: Text(
              'Error: $message',
              style: const TextStyle(color: Colors.red, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
        }

        return buildLoginForm(context);
      },
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Form(
      key: loginValidator.loginFormKey,
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomtextField(
            hint: 'Email',
            lable: 'Enter your email',
            controller: loginValidator.emailController,
            validator: loginValidator.validate(LoginValidatorTypes.email),
          ),
          const SizedBox(height: 24),
          CustomtextField(
            hint: 'Password',
            lable: 'Enter your password',
            controller: loginValidator.passwordController,
            validator: loginValidator.validate(LoginValidatorTypes.password),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RememberMeCheckbox(),
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
          CustomButton(
            text: 'Login',
            onPressed: () {
              if (loginValidator.loginFormKey.currentState?.validate() ??
                  false) {
                context.read<LoginViewModel>().handleIntent(
                      LoginIntent(
                        loginValidator.emailController.text,
                        loginValidator.passwordController.text,
                      ),
                    );
              }
            },
          ),
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
