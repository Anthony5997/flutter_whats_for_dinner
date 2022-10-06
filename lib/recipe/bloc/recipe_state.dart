part of 'recipe_bloc.dart';

abstract class RecipeState {
  const RecipeState();
}

class RecipeInitial extends RecipeState {}

class RecipeLoadingState extends RecipeState {}

class RecipeLoadedState extends RecipeState {}
