part of 'session_bloc.dart';

abstract class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

class SessionFridgeEvent extends SessionEvent {}

class SessionRecipeEvent extends SessionEvent {}

class SessionIngredientCategoryEvent extends SessionEvent {}

class SessionPageSelectedEvent extends SessionEvent {
  int index;
  SessionPageSelectedEvent(this.index) : super();
}

class SessionLogoutEvent extends SessionEvent {}
