part of 'recipe_list_bloc.dart';

abstract class RecipeListState extends Equatable {
  const RecipeListState();

  @override
  List<Object> get props => [];
}

class RecipeListInitial extends RecipeListState {}

class RecipeListLoadingState extends RecipeListState {}

class RecipeListLoadedState extends RecipeListState {
  List<dynamic> recipeResult;
  RecipeListLoadedState(this.recipeResult);
}

class RecipeDetailLoadingState extends RecipeListState {}

class RecipeDetailLoadedState extends RecipeListState {
  Recipe recipeResult;
  RecipeDetailLoadedState(this.recipeResult);
}

class RecipeListFavoriteLoadedState extends RecipeListState {
  List<dynamic> recipeResult;
  RecipeListFavoriteLoadedState(this.recipeResult);
}

class RecipeListEmptyState extends RecipeListState {}

class RecipeListAddIngredientState extends RecipeListState {}

class RecipeListDeleteIngredientState extends RecipeListState {}

class RecipeListErrorState extends RecipeListState {}
