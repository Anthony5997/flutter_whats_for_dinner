import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_cubit.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Authentication/services/form_submission_status.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepo;
  final AuthenticationFlowCubit authCubit;

  RegisterBloc({required this.authRepo, required this.authCubit})
      : super(RegisterState()) {
    on<RegisterEvent>(_onEvent);
  }

  @override
  Future<void> _onEvent(
      RegisterEvent event, Emitter<RegisterState> emit) async {
    // Username updated
    if (event is RegisterUsernameChanged) {
      emit(state.copyWith(username: event.username));

      // Email updated
    } else if (event is RegisterEmailChanged) {
      emit(state.copyWith(email: event.email));

      // Password updated
    } else if (event is RegisterPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is RegisterSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        await authRepo.register(
          state.username,
          state.email,
          state.password,
        );
        emit(state.copyWith(formStatus: SubmissionSuccess()));

        authCubit.showConfirmRegister(
          state.username,
          state.email,
          state.password,
        );
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
