import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/authentication/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/fridge/repository/fridge_repository.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';

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

        var fridgeResponse = await fridgeRepository.addIngredientFridge([
          {
            "fridgeId": fridge.id,
            "ingredientId": event.ingredientId,
            "quantity": event.quantity,
            "unit": event.unit,
          }
        ]);
        emit(FridgeLoadedState(fridgeResponse["fridge"], fridgeResponse["fridge"]["ingredients_list"], status: fridgeResponse["response"]));
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

        if (fridge.ingredients_list.length > 0) {
          emit(FridgeLoadedState(fridge, fridge.ingredients_list));
        } else {
          emit(FridgeEmptyState());
        }
      } catch (e) {
        emit(FridgeErrorState());
      }
    });

    on<FridgeLoadingEvent>((event, emit) async {
      try {
        final fridge = await fridgeRepository.getUserFridge();
        if (fridge.ingredients_list.length == 0) {
          emit(FridgeEmptyState());
        } else {
          emit(FridgeLoadedState(fridge, fridge.ingredients_list));
        }
      } catch (e) {
        emit(FridgeEmptyState());
      }
    });

    on<FridgeOnChangeEvent>((event, emit) async {
      emit(FridgeLoadingState());

      if (event.saisis.length == 0) {
        try {
          final fridge = event.fridge;
          emit(FridgeLoadedState(fridge, fridge.ingredients_list));
        } catch (e) {
          emit(FridgeEmptyState());
        }
      } else {
        List<Ingredient> ingredientFound = [];

        event.fridge.ingredients_list.forEach((ingredient) {
          if (ingredient.name.contains(event.saisis)) {
            ingredientFound.add(ingredient);
          }
        });

        if (ingredientFound.length == 0) {
          emit(FridgeNoResultsState(fridge: event.fridge, saisis: event.saisis, ingredient_list: ingredientFound));
        } else {
          var fridge = new Fridge(id: event.fridge.id, ingredients_list: event.fridge.ingredients_list);
          emit(FridgeLoadedState(fridge, ingredientFound));
        }
      }
    });
  }
}
