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
        print("RECIPE PASSER");

        print(recipeResult);
        emit(RecipeListLoadedState(recipeResult));
      } catch (e) {
        print("CATCH RECIPE");
        emit(RecipeListEmptyState());
      }
    });

    // on<RecipeDetailLoadingEvent>((event, emit) async {
    //   emit(RecipeDetailLoadingState());

    //   try {
    //     var recipeResult = await recipeListRepository.getOne(event.id);
    //     emit(RecipeDetailLoadedState(recipeResult));
    //   } catch (e) {
    //     emit(RecipeListEmptyState());
    //   }
    // });

    // on<RecipeDetailLoadedEvent>((event, emit) async {
    //   // var recipeResult = await recipeListRepository.getOne(event.id);
    //   // emit(RecipeDetailLoadedState(recipeResult));
    // });
  }
}
