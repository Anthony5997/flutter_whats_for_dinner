part of 'fridge_bloc.dart';

abstract class FridgeState extends Equatable {
  const FridgeState();

  @override
  List<Object> get props => [];
}

class FridgeInitial extends FridgeState {}

class FridgeLoadingState extends FridgeState {}

class FridgeLoadedState extends FridgeState {
  dynamic fridge;
  FridgeLoadedState(this.fridge);
}

class FridgeEmptyState extends FridgeState {}

class FridgeErrorState extends FridgeState {}
