import 'package:flutter/material.dart';
import 'package:flutter_login_signup/src/routes/pages.dart';
import 'package:flutter_login_signup/src/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/home/welcomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Horrocrux',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      // initialRoute: Routes.SPLASH,
      // routes: appRoutes(),
    );
  }
}
