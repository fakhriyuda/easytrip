import 'package:easytrip/theme/textTheme.dart';
import 'package:easytrip/view/auth/login/login_page.dart';
import 'package:easytrip/view/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      home: const LoginPage(),
    );
  }
}
