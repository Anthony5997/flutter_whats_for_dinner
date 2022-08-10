part of 'fridge_bloc.dart';

abstract class FridgeState extends Equatable {
  const FridgeState();
  
  @override
  List<Object> get props => [];
}

class FridgeInitial extends FridgeState {}
