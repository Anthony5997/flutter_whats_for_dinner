part of 'confirmation_bloc.dart';

class ConfirmationState {
  final String code;
  bool get isValidCode => code.length == 6;

  final credentials;

  final FormSubmissionStatus formStatus;

  ConfirmationState({
    this.credentials,
    this.code = '',
    this.formStatus = const InitialFormStatus(),
  });

  ConfirmationState copyWith({
    String? code,
    FormSubmissionStatus? formStatus,
  }) {
    return ConfirmationState(
      credentials: credentials,
      code: code ?? this.code,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
