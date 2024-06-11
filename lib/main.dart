import 'package:easytrip/bloc/register/register_bloc.dart';
import 'package:easytrip/screens/auth/login/login_page.dart';
import 'package:easytrip/constants/theme/textTheme.dart';
import 'package:easytrip/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: myTheme,
        home: const LoginPage(),
      ),
    );
  }
}
