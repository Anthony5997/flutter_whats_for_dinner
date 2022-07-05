part of 'session_cubit.dart';

abstract class SessionState {}

class UnknownSessionState extends SessionState {}

class Unauthenticated extends SessionState {}

class Authenticated extends SessionState {
  final dynamic user;

  Authenticated({this.user});
}
