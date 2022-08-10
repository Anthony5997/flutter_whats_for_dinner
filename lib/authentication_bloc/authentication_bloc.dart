import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/src/widgets/form.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final Future<SharedPreferences> _userPreferences =
      SharedPreferences.getInstance();

  // User user = User(id: "", nickname: "", email: "", password: "");

  AuthenticationBloc() : super(AutoConnexionAttemptState()) {
    on<AutoConnexionAttemptEvent>((event, emit) {
      // emit(ConnexionLoadingState());
      authenticationRepository.attemptAutoLogin(emit);
    });

    on<ShowLoginEvent>((event, emit) {
      emit(LoginState());
    });

    on<ShowRegisterEvent>((event, emit) {
      emit(RegisterState());
    });

    on<LoginEvent>((event, emit) async {
      try {
        print('try login');
        print(event.email);
        print(event.password);
        var response =
            await authenticationRepository.login(event.email, event.password);
        if (response["status"] == true) {
          print("emit bon");
          emit(AuthenticationSuccessState());
        } else {
          print("emit pas bon");

          emit(LoginState());
        }
      } catch (e) {
        print('catch');
      }
    });

    on<RegisterEvent>((event, emit) async {
      try {
        print('try register');
        print(event.nickname);
        print(event.email);
        print(event.password);
        var response = await authenticationRepository.register(
            event.nickname, event.email, event.password);
        if (response["status"] == true) {
          emit(AuthenticationSuccessState());
        } else {
          emit(RegisterState());
        }
      } catch (e) {
        print('catch');
      }
    });

    on<AuthenticationSuccessEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LogoutEvent>((event, emit) {
      authenticationRepository.logout(emit);
    });
  }
}
