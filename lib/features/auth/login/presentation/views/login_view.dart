import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/network/api/extract_error_message.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:elevate_ecommerce/main.dart';
import 'package:elevate_ecommerce/utils/string_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: StringsManager.login.tr(),
      ),
      body: BlocProvider(
          create: (context) => getIt<LoginViewModel>(),
          child: BlocListener<LoginViewModel, LoginState>(
            listener: (context, state) {
              if (state is SuccessState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.mainLayOut, (Route route) => false);
                });
              }
              if (state is ErrorState) {
                scaffoldMessengerKey.currentState?.clearSnackBars();
                var snackBarText = extractErrorMessage(state.exception);
                final snackBar = SnackBar(
                  content: Text(snackBarText),
                  duration: const Duration(seconds: 2),
                );
                scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LoginViewBody(),
            ),
          )),
    );
  }
}
