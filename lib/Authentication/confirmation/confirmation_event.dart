part of 'confirmation_bloc.dart';

abstract class ConfirmationEvent {}

class ConfirmationCodeChanged extends ConfirmationEvent {
  final String code;

  ConfirmationCodeChanged(this.code);
}

class ConfirmationSubmitted extends ConfirmationEvent {}

class ConfirmationSucessEvent extends ConfirmationEvent {}
