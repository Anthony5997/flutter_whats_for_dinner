part of 'fridge_bloc.dart';

abstract class FridgeEvent extends Equatable {
  const FridgeEvent();

  @override
  List<Object> get props => [];
}

class FridgeEventInitial extends FridgeEvent {}

class FridgeLoadingEvent extends FridgeEvent {}

class FridgeLoadedEvent extends FridgeEvent {}
