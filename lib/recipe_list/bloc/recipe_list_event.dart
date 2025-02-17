part of 'recipe_list_bloc.dart';

abstract class RecipeListEvent extends Equatable {
  const RecipeListEvent();

  @override
  List<Object> get props => [];
}

class RecipeListEventInitial extends RecipeListEvent {}

class RecipeListLoadingEvent extends RecipeListEvent {}

class RecipeListLoadedEvent extends RecipeListEvent {}

class RecipeListOnChangeEvent extends RecipeListEvent {
  const RecipeListOnChangeEvent({required this.saisis});
  final String saisis;
}

class RecipeDetailLoadedEvent extends RecipeListEvent {}

class RecipeFavoriteEvent extends RecipeListEvent {}

class RecipeRatingEvent extends RecipeListEvent {
    const RecipeRatingEvent({required this.id , required this.rate});
  final String id;
  final double rate;
}

class RecipeFavoriteListEvent extends RecipeListEvent {}

class RecipeDetailLoadingEvent extends RecipeListEvent {}

class RecipeListAddIngredientEvent extends RecipeListEvent {}

class RecipeListDeleteIngredientEvent extends RecipeListEvent {}
