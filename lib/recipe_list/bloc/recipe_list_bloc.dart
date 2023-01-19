import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';

part 'recipe_list_event.dart';
part 'recipe_list_state.dart';

class RecipeListBloc extends Bloc<RecipeListEvent, RecipeListState> {
  final RecipeListRepository recipeListRepository = RecipeListRepository();

  RecipeListBloc() : super(RecipeListInitial()) {
    on<RecipeListEventInitial>((event, emit) {
      emit(RecipeListEmptyState());
    });
    on<RecipeListLoadedEvent>((event, emit) {});

    on<RecipeListLoadingEvent>((event, emit) async {
      emit(RecipeListLoadingState());

      try {
        var recipeResult = await recipeListRepository.get();
        emit(RecipeListLoadedState(recipeResult));
      } catch (e) {
        emit(RecipeListEmptyState());
      }
    });

    on<RecipeListOnChangeEvent>((event, emit) async {
      emit(RecipeListLoadingState());
      var saisis = await event.saisis.length;

      if (saisis == 0) {
        emit(RecipeListEmptyState());
      } else {
        try {
          var recipeResult = await recipeListRepository.searchRecipe(event.saisis);
          emit(RecipeListLoadedState(recipeResult));
        } catch (e) {
          emit(RecipeListEmptyState());
        }
      }
    });


    on<RecipeRatingEvent>((event, emit) async {
      emit(RecipeListLoadingState());
      var recipeId = await event.id;
      var userRate = await event.rate;

      if (userRate == 0) {
        emit(RecipeListEmptyState());
      } else {
        try {
          var recipeResult = await recipeListRepository.sendRating(recipeId, userRate);
      
        } catch (e) {
      
        }
      }
    });

    

    on<RecipeFavoriteListEvent>((event, emit) async {
      // emit(RecipeListLoadingState());

      try {
        var recipeResult = await recipeListRepository.getFavorites();

        if (recipeResult.length > 0) {
          emit(RecipeListFavoriteLoadedState(recipeResult));
        } else {
          emit(RecipeListEmptyState());
        }
      } catch (e) {
        emit(RecipeListEmptyState());
      }
    });
  }
}
