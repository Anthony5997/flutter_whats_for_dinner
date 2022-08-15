part of 'session_bloc.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionState {}

class SessionPageSelectedState extends SessionState {
  final int currentIndex;

  SessionPageSelectedState({required this.currentIndex}) : super();

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoadingState extends SessionState {
  @override
  String toString() => 'PageLoading';
}

class SessionTest extends SessionState {
  SessionTest(ingredientCat);
}

class SessionIngredientCategoryState extends SessionState {}

class SessionRecipeState extends SessionState {}

class SessionLogoutState extends SessionState {}
