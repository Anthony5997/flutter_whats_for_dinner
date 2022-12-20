import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';

part 'ingredient_categorie_event.dart';
part 'ingredient_categorie_state.dart';

class IngredientCategorieBloc extends Bloc<IngredientCategorieEvent, IngredientCategorieState> {
  final IngredientCategoryRepository ingredientCategoryRepository = IngredientCategoryRepository();
  final SessionBloc sessionBloc = SessionBloc();

  IngredientCategorieBloc() : super(IngredientCategorieInitial()) {
    on<IngredientCategorieEvent>((event, emit) {});

    on<IngredientCategorieLoadedEvent>((event, emit) {});

    on<IngredientCategorieLoadingEvent>((event, emit) async {
      var ingredientCat = await ingredientCategoryRepository.get();

      emit(IngredientCategorieLoadedState(ingredientCat['results']));
    });


    on<IngredientListEventInitial>((event, emit) {

      emit(IngredientListLoadedState(event.ingredients, event.ingredients));
    });

    on<IngredientListOnChangeEvent>((event, emit) {
        emit(IngredientCategorieLoadingState());

      var ingredientsInCategory = event.ingredientsInCategory;
      var ingredients = event.ingredientsFind;

        if (event.saisis.length == 0) {
        try {
          emit(IngredientListLoadedState(ingredientsInCategory, ingredientsInCategory));
        } catch (e) {
          // emit(FridgeEmptyState());
        }
      } else {
        List<Ingredient> ingredientFound = [];

        ingredientsInCategory.forEach((ingredient) {
          if (ingredient.name.contains(event.saisis)) {
            ingredientFound.add(ingredient);
          }
        });

        if (ingredientFound.length == 0) {
          emit(IngredientListNoResultsState(ingredientsInCategory, ingredientFound));
        } else {
          emit(IngredientListLoadedState(ingredientsInCategory, ingredientFound));
        }
      }
    });
  }
}
