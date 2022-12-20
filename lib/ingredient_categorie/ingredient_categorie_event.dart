part of 'ingredient_categorie_bloc.dart';

abstract class IngredientCategorieEvent extends Equatable {
  const IngredientCategorieEvent();

  @override
  List<Object> get props => [];
}

class IngredientCategorieEventInitial extends IngredientCategorieEvent {}

class IngredientCategorieLoadingEvent extends IngredientCategorieEvent {}

class IngredientCategorieLoadedEvent extends IngredientCategorieEvent {}

class IngredientListEventInitial extends IngredientCategorieEvent {

List<Ingredient> ingredients;

  IngredientListEventInitial(this.ingredients);
}

class IngredientListOnChangeEvent extends IngredientCategorieEvent {

  List<Ingredient> ingredientsInCategory;
  List<Ingredient> ingredientsFind;
  String saisis;

  IngredientListOnChangeEvent(this.saisis, this.ingredientsInCategory, this.ingredientsFind);
}


