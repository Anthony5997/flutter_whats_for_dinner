part of 'ingredient_categorie_bloc.dart';

abstract class IngredientCategorieEvent extends Equatable {
  const IngredientCategorieEvent();

  @override
  List<Object> get props => [];
}

class IngredientCategorieEventInitial extends IngredientCategorieEvent {}

class IngredientCategorieLoadingEvent extends IngredientCategorieEvent {}

class IngredientCategorieLoadedEvent extends IngredientCategorieEvent {}
