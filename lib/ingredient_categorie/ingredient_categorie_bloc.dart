import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ingredient_categorie_event.dart';
part 'ingredient_categorie_state.dart';

class IngredientCategorieBloc extends Bloc<IngredientCategorieEvent, IngredientCategorieState> {
  IngredientCategorieBloc() : super(IngredientCategorieInitial()) {
    on<IngredientCategorieEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
