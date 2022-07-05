part of 'authentication_flow_cubit.dart';

abstract class AuthenticationFlowState extends Equatable {
  const AuthenticationFlowState();

  @override
  List<Object> get props => [];
}

class AuthenticationFlowInitial extends AuthenticationFlowState {}

class AuthenticationFlowLogin extends AuthenticationFlowState {}

class AuthenticationFlowRegister extends AuthenticationFlowState {}

class AuthenticationFlowConfirmRegister extends AuthenticationFlowState {}
