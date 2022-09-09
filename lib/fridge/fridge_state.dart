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
  dynamic status;
  FridgeLoadedState(this.fridge, {this.status});
}

class FridgeEmptyState extends FridgeState {}

class FridgeAddIngredientState extends FridgeState {}

class FridgeDeleteIngredientState extends FridgeState {}

class FridgeErrorState extends FridgeState {}
