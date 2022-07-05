import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Authentication/services/authentication_credential.dart';

part 'authentication_flow_state.dart';

class AuthenticationFlowCubit extends Cubit<AuthenticationFlowState> {
  // final sessionCubit;

  AuthenticationFlowCubit(
      // this.sessionCubit
      )
      : super(AuthenticationFlowLogin());

  // final SessionCubit sessionCubit;
  late final AuthenticationCredentials credentials;

  void showLogin() => emit(AuthenticationFlowLogin());
  void showSignUp() => emit(AuthenticationFlowRegister());
  void showConfirmRegister(
    String username,
    String email,
    String password,
    // String? userId,
  ) {
    credentials = AuthenticationCredentials(
      username: username,
      email: email,
      password: password,
    );
    emit(AuthenticationFlowConfirmRegister());
  }

  void launchSession(AuthenticationCredentials credentials) =>
      // {sessionCubit.showSession(credentials)};
      print("session lancé");
}
