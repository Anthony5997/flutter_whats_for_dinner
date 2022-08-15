part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AutoConnexionAttemptState extends AuthenticationState {}

class LoginState extends AuthenticationState {}

class RegisterState extends AuthenticationState {}

class AuthenticationSuccessState extends AuthenticationState {}

class ConnexionLoadingState extends AuthenticationState {}

class LogoutState extends AuthenticationState {}
