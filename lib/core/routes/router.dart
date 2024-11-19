import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce/features/home/presentation/mian_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:flutter/material.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
