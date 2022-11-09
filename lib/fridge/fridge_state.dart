part of 'fridge_bloc.dart';

abstract class FridgeState extends Equatable {
  const FridgeState();

  @override
  List<Object> get props => [];
}

class FridgeInitial extends FridgeState {}

class FridgeLoadingState extends FridgeState {}

class FridgeLoadedState extends FridgeState {
  Fridge fridge;
  List<Ingredient> ingredient_list;
  dynamic status;
  dynamic units;
  FridgeLoadedState(this.fridge, this.ingredient_list, this.units, {this.status});
}

class FridgeEmptyState extends FridgeState {}

class FridgeNoResultsState extends FridgeState {
  FridgeNoResultsState({required this.fridge, required this.ingredient_list, required this.saisis});
  Fridge fridge;
  List<Ingredient> ingredient_list;
  String saisis;
}

class FridgeAddIngredientState extends FridgeState {}

class FridgeDeleteIngredientState extends FridgeState {}

class FridgeErrorState extends FridgeState {}
