part of 'recipe_bloc.dart';

abstract class RecipeEvent {
  const RecipeEvent();
}

class RecipeEventInitial extends RecipeEvent {}

class RecipeLoadingEvent extends RecipeEvent {}

class RecipeLoadedEvent extends RecipeEvent {}
