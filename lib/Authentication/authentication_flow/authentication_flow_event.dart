part of 'authentication_flow_bloc.dart';

abstract class AuthenticationFlowEvent extends Equatable {
  const AuthenticationFlowEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationFlowShowLoginEvent extends AuthenticationFlowEvent {}

class AuthenticationFlowShowRegisterEvent extends AuthenticationFlowEvent {}

class AuthenticationFlowShowConfirmRegisterEvent
    extends AuthenticationFlowEvent {
  AuthenticationCredentials credential;

  AuthenticationFlowShowConfirmRegisterEvent(this.credential);
}

class AuthenticationFlowShowAuthenticationSuccessEvent
    extends AuthenticationFlowEvent {}

class AuthenticationFlowShowLogoutEvent extends AuthenticationFlowEvent {}
