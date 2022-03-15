import 'package:flutter/widgets.dart';
import 'package:flutter_login_signup/src/home/welcomePage.dart';
import 'package:flutter_login_signup/src/request_permission/request_permission_page.dart';
import 'package:flutter_login_signup/src/routes/routes.dart';
import 'package:flutter_login_signup/src/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSION: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => WelcomePage(),
  };
}
