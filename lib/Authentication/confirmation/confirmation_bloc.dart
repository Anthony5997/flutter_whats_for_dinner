import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_cubit.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Authentication/services/form_submission_status.dart';

part 'confirmation_event.dart';
part 'confirmation_state.dart';

class ConfirmationBloc extends Bloc<ConfirmationEvent, ConfirmationState> {
  final AuthRepository authRepo;
  final AuthenticationFlowCubit authCubit;

  ConfirmationBloc(
    this.authRepo,
    this.authCubit,
  ) : super(ConfirmationState()) {
    on<ConfirmationEvent>(_onEvent);
  }

  @override
  Future<void> _onEvent(
      ConfirmationEvent event, Emitter<ConfirmationState> emit) async {
    // Confirmation code updated
    if (event is ConfirmationCodeChanged) {
      emit(state.copyWith(code: event.code));

      // Form submitted
    } else if (event is ConfirmationSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));

      try {
        final userId = await authRepo.confirmRegister(
          authCubit.credentials.username,
          state.code,
        );
        print(userId);
        emit(state.copyWith(formStatus: SubmissionSuccess()));

        final credentials = authCubit.credentials;
        credentials.userId = userId;
        print(credentials);
        authCubit.launchSession(credentials);
      } catch (e) {
        print(e);
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    }
  }
}
