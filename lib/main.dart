import 'package:appvetnew/src/pages/contrasenaOlv.dart';
import 'package:appvetnew/src/pages/homepage.dart';
import 'package:appvetnew/src/pages/login.dart';
import 'package:appvetnew/src/pages/on_boarding.dart';
import 'package:appvetnew/src/pages/registro.dart';
// import 'package:appvetnew/src/pages/progres_view.dart';
import 'package:appvetnew/src/pages/splash_view.dart';
import 'package:appvetnew/src/painter/progres_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.purple,
          ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/onBording': (context) => const OnBoarding(),
        '/homePage': (context) => HomePage(),
        '/progressIndicator': (context) => const Progresview(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/forgotPassword': (context) => ForgotPasswordPage(),
      },
    );
  }
}
