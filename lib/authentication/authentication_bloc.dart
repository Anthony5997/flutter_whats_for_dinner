import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        print('catch');
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(ConnexionLoadingState());

      try {
        var response = await authenticationRepository.register(event.nickname, event.email, event.password);
        if (response["status"] == true) {
          emit(AuthenticationSuccessState());
        } else {
          print("response");
          print(response['errors']);
          emit(RegisterState(message: response["message"]));
        }
      } catch (e) {
        print('catch');
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
