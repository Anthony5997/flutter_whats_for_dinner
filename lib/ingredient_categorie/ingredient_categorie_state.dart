part of 'ingredient_categorie_bloc.dart';

abstract class IngredientCategorieState extends Equatable {
  const IngredientCategorieState();

  @override
  List<Object> get props => [];
}

class IngredientCategorieInitial extends IngredientCategorieState {}

class IngredientCategorieLoadedState extends IngredientCategorieState {
  dynamic ingredientCat;
  IngredientCategorieLoadedState(this.ingredientCat);
}

class IngredientCategorieLoadingState extends IngredientCategorieState {}

class IngredientCategorieErrorState extends IngredientCategorieState {}


class IngredientListLoadedState extends IngredientCategorieState {

   List<Ingredient> ingredientsInCategory;
  List<Ingredient> ingredients;
  IngredientListLoadedState(this.ingredientsInCategory, this.ingredients);
}

class IngredientListNoResultsState extends IngredientCategorieState {
  List<Ingredient> ingredientsInCategory;
  List<Ingredient> ingredients;
  IngredientListNoResultsState(this.ingredientsInCategory, this.ingredients);
}







