part of 'ingredient_categorie_bloc.dart';

abstract class IngredientCategorieState extends Equatable {
  const IngredientCategorieState();

  @override
  List<Object> get props => [];
}

class IngredientCategorieInitial extends IngredientCategorieState {}

class IngredientCategorieLoadedState extends IngredientCategorieState {
  IngredientCategorieLoadedState({required this.ingredientCat});

  List<dynamic> ingredientCat;
}
