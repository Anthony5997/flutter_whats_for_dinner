import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();

  AuthenticationBloc() : super(AutoConnexionAttemptState()) {
    on<AutoConnexionAttemptEvent>((event, emit) async {
      emit(ConnexionLoadingState());
      await authenticationRepository.attemptAutoLogin(emit);
    });

    on<ShowLoginEvent>((event, emit) {
      emit(LoginState());
    });

    on<ShowRegisterEvent>((event, emit) {
      emit(RegisterState());
    });

    on<LoginEvent>((event, emit) async {
      emit(ConnexionLoadingState());
      try {
        var response = await authenticationRepository.login(event.email, event.password);
        if (response["status"] == true) {
          emit(AuthenticationSuccessState());
        } else {
          emit(LoginState(message: response["message"]));
        }
      } catch (e) {
        emit(LoginState(message: "Une erreur est survenue."));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(ConnexionLoadingState());

      try {
        var response = await authenticationRepository.register(event.nickname, event.email, event.password);
        if (response["status"] == true) {
          emit(AuthenticationSuccessState());
        } else {
          emit(RegisterState(message: response["message"]));
        }
      } catch (e) {
        emit(RegisterState(message: "Une erreur est survenue."));
      }
    });

    on<ConnexionLoadingEvent>((event, emit) {
      emit(ConnexionLoadingState());
    });

    on<AuthenticationSuccessEvent>((event, emit) {});

    on<LogoutEvent>((event, emit) {
      authenticationRepository.logout(emit);
    });
  }
}
