import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/fridge/repository/fridge_repository.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';

part 'fridge_event.dart';
part 'fridge_state.dart';

class FridgeBloc extends Bloc<FridgeEvent, FridgeState> {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();

  final FridgeRepository fridgeRepository = FridgeRepository();
  FridgeBloc() : super(FridgeInitial()) {
    on<FridgeEvent>((event, emit) {});
    on<FridgeLoadedEvent>((event, emit) {});

    on<FridgeAddIngredientEvent>((event, emit) async {
      emit(FridgeLoadingState());
      try {
        Fridge fridge = await fridgeRepository.getUserFridge();

        fridge = await fridgeRepository.addIngredientFridge([
          {
            "fridgeId": fridge.id,
            "ingredientId": event.ingredientId,
            "quantity": event.quantity,
            "unit": event.unit,
          }
        ]);

        emit(FridgeLoadedState(fridge));
      } catch (e) {
        emit(FridgeErrorState());
      }
    });
    on<FridgeDeleteIngredientEvent>((event, emit) async {
      emit(FridgeLoadingState());

      try {
        Fridge fridge = await fridgeRepository.getUserFridge();

        fridge = await fridgeRepository.deleteIngredientFridge([
          {
            "fridgeId": fridge.id,
            "ingredientId": event.ingredientId,
          }
        ]);
        emit(FridgeLoadedState(fridge));
      } catch (e) {
        emit(FridgeErrorState());
      }
    });

    on<FridgeLoadingEvent>((event, emit) async {
      try {
        final fridge = await fridgeRepository.getUserFridge();
        emit(FridgeLoadedState(fridge));
      } catch (e) {
        emit(FridgeEmptyState());
      }
    });
  }
}
