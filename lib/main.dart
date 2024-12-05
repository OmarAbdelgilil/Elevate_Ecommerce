import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce/core/cache/hive_service.dart';
import 'package:elevate_ecommerce/core/common/bloc_observer.dart';
import 'package:elevate_ecommerce/core/common/colors.dart';
import 'package:elevate_ecommerce/core/di/di.dart';
import 'package:elevate_ecommerce/core/providers/token_provider.dart';
import 'package:elevate_ecommerce/core/providers/user_provider.dart';
import 'package:elevate_ecommerce/core/routes/app_routes.dart';
import 'package:elevate_ecommerce/core/routes/router.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_model.dart';
import 'package:elevate_ecommerce/features/auth/logged_user_data/data/models/user_response/user.dart';
import 'package:elevate_ecommerce/utils/token_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  Bloc.observer = SimpleBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final TokenStorage tokenStorage = TokenStorage();
  final String? token = await tokenStorage.getToken();
  if (token != null) {
    await TokenProvider().saveToken(token);
    print("Token saved: ${TokenProvider().token}");
    final userModel = await HiveService().getUser(token);
    UserData userData = userModel!.toUserData();
    UserProvider().setUserData(userData);
  }
  print("Token retrieved: $token");

  final String initialRoute =
      token != null ? AppRoutes.mainLayOut : AppRoutes.login;

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Path to translations
      fallbackLocale: Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => TokenProvider()),
        ],
        child: MyApp(initialRoute: initialRoute),
      ),
    ),
  );
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
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColorLight: primaryColor,
        ),
        title: 'Flower app',
        onGenerateRoute: manageRoutes,
        initialRoute: AppRoutes.login,
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
