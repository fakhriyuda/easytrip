import 'package:easytrip/bloc/register/register_bloc.dart';
import 'package:easytrip/utils/locator.dart';
import 'package:flutter/material.dart';

class BlocLocator {
  Future<void> setup() async {
    debugPrint('BlocLocator initialized');

    locator
    ..registerSingleton<RegisterBloc>(RegisterBloc());
  }
}
