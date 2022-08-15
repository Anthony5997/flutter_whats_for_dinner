part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  const LoginEvent({this.email, this.password});

  final String? email;
  final String? password;
}

class ShowLoginEvent extends AuthenticationEvent {}

class ShowRegisterEvent extends AuthenticationEvent {}

class AuthenticationSuccessEvent extends AuthenticationEvent {}

class AutoConnexionAttemptEvent extends AuthenticationEvent {}

class ConnexionLoadingEvent extends AuthenticationEvent {}

class RegisterEvent extends AuthenticationEvent {
  const RegisterEvent({this.nickname, this.email, this.password});

  final String? nickname;
  final String? email;
  final String? password;
}

class LogoutEvent extends AuthenticationEvent {}
