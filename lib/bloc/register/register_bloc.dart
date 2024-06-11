import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  double progress = 1;
  double steps = 4;
  bool receiveEmail = false;

  RegisterBloc() : super(RegisterInitial()) {
    // Register
    on<NextStep>((event, emit) {
      debugPrint('current Progress: $progress');
      if (progress.toInt() < steps.toInt()) {
        progress = progress.toInt() + 1;
        debugPrint('afterclick: $progress');
        switch (progress.toInt()) {
          case 1:
            emit(RegisterStepOne());
            break;
          case 2:
            emit(RegisterStepTwo(receiveEmail: receiveEmail));
            break;
          case 3:
            emit(RegisterStepThree());
            break;
          case 4:
            emit(RegisterStepFour());
            break;
          default:
            emit(RegisterInitial());
        }
      }
    });
    on<PreviousStep>((event, emit) {
      debugPrint('current Progress: $progress');
      if (progress.toInt() == 1) {
        Navigator.pop(event.context);
      } else {
        progress = progress - 1;
        debugPrint('Progress: $progress');
      }
      switch (progress.toInt()) {
        case 1:
          emit(RegisterStepOne());
          break;
        case 2:
          emit(RegisterStepTwo(receiveEmail: receiveEmail));
          break;
        case 3:
          emit(RegisterStepThree());
          break;
        case 4:
          emit(RegisterStepFour());
          break;
        default:
          emit(RegisterInitial());
      }
    });
    // Step 2
    on<ReceiveEmail>((event, emit) {
      receiveEmail = event.value;
      emit(RegisterStepTwo(receiveEmail: receiveEmail));
      debugPrint('Receive Email: $receiveEmail');
    });
  }
}
