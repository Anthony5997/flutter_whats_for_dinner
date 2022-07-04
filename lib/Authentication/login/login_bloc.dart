import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_event.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_state.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Authentication/services/form_submission_status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  @override
  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is LoginUsernameChanged) {
      print(event);
      emit(state.copyWith(username: event.username));
    }
    // password update
    else if (event is LoginPasswordChanged) {
      print(event);

      emit(state.copyWith(password: event.password));
    }
    //form submitted
    else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      print(event);

      try {
        print('try');

        await authRepo.login(
          state.username,
          state.password,
        );
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        print('catch');

        emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    }
  }
}
