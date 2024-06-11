part of 'register_bloc.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterStepOne extends RegisterState {}

final class RegisterStepTwo extends RegisterState {
  final bool receiveEmail;

  const RegisterStepTwo({this.receiveEmail = false});

  @override
  List<Object> get props => [receiveEmail];
}

final class RegisterStepThree extends RegisterState {}

final class RegisterStepFour extends RegisterState {}

