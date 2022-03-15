import 'package:flutter/widgets.dart';
import 'package:flutter_login_signup/src/routes/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends ChangeNotifier {
  final Permission _locationPermission;
  String? _routeName;
  String? get routeName => _routeName;

  SplashController(this._locationPermission);

  Future<void> checkPermission() async {
    final isGranted = await this._locationPermission.isGranted;
    _routeName = isGranted ? Routes.HOME : Routes.PERMISSION;

    notifyListeners();
  }
}
