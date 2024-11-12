import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce/features/home/home.dart';
import 'package:flutter/material.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const Home());
    default:
      return MaterialPageRoute(builder: (context) => const RouteNotFound());
  }
}
