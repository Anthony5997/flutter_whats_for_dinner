part of 'fridge_bloc.dart';

abstract class FridgeEvent extends Equatable {
  const FridgeEvent();

  @override
  List<Object> get props => [];
}

class FridgeEventInitial extends FridgeEvent {}

class FridgeLoadingEvent extends FridgeEvent {}

class FridgeLoadedEvent extends FridgeEvent {}

class FridgeAddIngredientEvent extends FridgeEvent {
  const FridgeAddIngredientEvent({required this.quantity, this.unit, required this.ingredientId});

  final String quantity;
  final String? unit;
  final int ingredientId;
}

class FridgeDeleteIngredientEvent extends FridgeEvent {
  const FridgeDeleteIngredientEvent({required this.ingredientId});

  final int ingredientId;
}
