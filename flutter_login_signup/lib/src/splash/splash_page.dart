import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/splash/splash_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();

  //State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SplashController(Permission.locationWhenInUse);

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance!.addPostFrameCallback
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        _controller.checkPermission();
      },
    );
    _controller.addListener(() {});
    if (_controller.routeName != null) {
      Navigator.pushReplacementNamed(context, _controller.routeName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
