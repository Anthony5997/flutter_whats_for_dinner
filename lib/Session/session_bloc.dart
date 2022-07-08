import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final AuthRepository authRepo;
  final AuthenticationFlowBloc authBloc;

  SessionBloc(this.authRepo, this.authBloc) : super(SessionInitial()) {
    on<SessionEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SessionLogoutEvent>((event, emit) {});
  }
}
