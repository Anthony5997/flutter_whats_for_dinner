part of 'authentication_flow_bloc.dart';

abstract class AuthenticationFlowState extends Equatable {
  const AuthenticationFlowState();

  @override
  List<Object> get props => [];
}

class AuthenticationFlowInitial extends AuthenticationFlowState {}

class AuthenticationFlowShowLoginState extends AuthenticationFlowState {}

class AuthenticationFlowShowRegisterState extends AuthenticationFlowState {}

class AuthenticationFlowShowConfirmRegisterState
    extends AuthenticationFlowState {
  var credentials;

  AuthenticationFlowShowConfirmRegisterState({
    this.credentials,
  });

  AuthenticationFlowShowConfirmRegisterState copyWith({
    credentials,
  }) {
    return AuthenticationFlowShowConfirmRegisterState(credentials: credentials);
  }
}

class AuthenticationFlowShowAuthenticationSuccessState
    extends AuthenticationFlowState {}

class AuthenticationFlowShowLogoutState extends AuthenticationFlowState {}
