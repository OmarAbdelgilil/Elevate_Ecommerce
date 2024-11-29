import 'dart:io';

import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/router.dart';
import 'package:elevate_ecommerce/utils/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  final TokenStorage tokenStorage = TokenStorage();
  final String? token = await tokenStorage.getToken();
  print("Token retrieved: $token");

  final String initialRoute =
      token != null ? AppRoutes.mainLayOut : AppRoutes.login;

  runApp(MyApp(initialRoute: initialRoute));
}

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColorLight: primaryColor,
        ),
        title: 'Flower app',
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.mainLayOut,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    final client = super.createHttpClient(context);
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) =>
            true; // bypass SSL verification
    return client;
  }
}
