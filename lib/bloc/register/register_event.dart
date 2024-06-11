part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class NextStep extends RegisterEvent {}

class PreviousStep extends RegisterEvent {
  final BuildContext context;

  const PreviousStep(this.context);
}

class ReceiveEmail extends RegisterEvent {
  final bool value;

  const ReceiveEmail(this.value);
}
