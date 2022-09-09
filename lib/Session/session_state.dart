part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionState {}

class SessionPageSelectedState extends SessionState {
  int currentIndex;

  SessionPageSelectedState(this.currentIndex) : super();

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class SessionLoadingState extends SessionState {
  @override
  String toString() => 'PageLoading';
}

class SessionTest extends SessionState {
  SessionTest(ingredientCat);
}

class SessionIngredientCategoryState extends SessionState {}

class SessionRecipeListState extends SessionState {}

class SessionRecipeState extends SessionState {}

class SessionLogoutState extends SessionState {}
