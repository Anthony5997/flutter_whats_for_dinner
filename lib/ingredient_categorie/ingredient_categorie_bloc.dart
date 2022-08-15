import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';

part 'ingredient_categorie_event.dart';
part 'ingredient_categorie_state.dart';

class IngredientCategorieBloc
    extends Bloc<IngredientCategorieEvent, IngredientCategorieState> {
  final IngredientCategoryRepository ingredientCategoryRepository =
      IngredientCategoryRepository();
  final SessionBloc sessionBloc = SessionBloc();

  // final Future<SharedPreferences> _userPreferences =
  //     SharedPreferences.getInstance();

  IngredientCategorieBloc() : super(IngredientCategorieInitial()) {
    on<IngredientCategorieEvent>((event, emit) {
      // TODO: implement event handler
    });

    // on<IngredientCategorieInitialEvent>((event, emit) async {
    //   var ingredientCat = await ingredientCategoryRepository.get();

    //   print("INGREDIENT CAT DANS INGREDIENT-CATEGORY BLOC");
    //   print(ingredientCat);
    //   print("=========================================");

    //   emit(IngredientCategorieLoadedState(ingredientCat: ingredientCat));
    // });
  }
}
