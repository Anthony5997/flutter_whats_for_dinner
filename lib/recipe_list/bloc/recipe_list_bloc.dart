import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
  }
}
