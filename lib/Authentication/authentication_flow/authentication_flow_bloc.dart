import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Authentication/services/authentication_credential.dart';

part 'authentication_flow_event.dart';
part 'authentication_flow_state.dart';

class AuthenticationFlowBloc
    extends Bloc<AuthenticationFlowEvent, AuthenticationFlowState> {
  AuthenticationFlowBloc() : super(AuthenticationFlowShowLoginState()) {
    print("FLOW STATE");
    print(state);
    print("============================");

    final auth = AuthRepository();

    on<AuthenticationFlowEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthenticationFlowShowLoginEvent>((event, emit) {
      emit(AuthenticationFlowShowLoginState());
    });

    on<AuthenticationFlowShowRegisterEvent>((event, emit) {
      emit(AuthenticationFlowShowRegisterState());
    });

    on<AuthenticationFlowShowConfirmRegisterEvent>((event, emit) {
      print("STATE in comfirm");
      print(state);
      print("EVENT CREDENTIAL in comfirm");
      print(event.credential);
      print(event.credential.email);
      print(event.credential.username);
      print(event.credential.userId);
      print("============================");

      // credentials = AuthenticationCredentials(username: 'test');
      emit(AuthenticationFlowShowConfirmRegisterState(
          credentials: event.credential));
      print("STATE in comfirm");
      print(state);
    });

    on<AuthenticationFlowShowAuthenticationSuccessEvent>((event, emit) {
      emit(AuthenticationFlowShowAuthenticationSuccessState());
    });

    on<AuthenticationFlowShowLogoutEvent>((event, emit) {
      print("LOGOUT");
      emit(AuthenticationFlowShowLogoutState());
    });

    // void showConfirmRegister(
    //   String username,
    //   String email,
    //   String password,
    //   // String? userId,
    // ) {
    //   credentials = AuthenticationCredentials(
    //     username: username,
    //     email: email,
    //     password: password,
    //   );
    //   emit(AuthenticationFlowConfirmRegister());
  }

  //   void launchSession(AuthenticationCredentials credentials) =>
  //       print("session lancé");
  // }
}
