import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/widgets/custom_appbar.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: 'Login',
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginViewModel>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
