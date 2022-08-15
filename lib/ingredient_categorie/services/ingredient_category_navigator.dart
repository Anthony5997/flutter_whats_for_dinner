import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/views/ingredient_category_view.dart';

class IngredientCategoryNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<IngredientCategorieBloc>(
        create: (context) => IngredientCategorieBloc(),
        child: BlocBuilder<IngredientCategorieBloc, IngredientCategorieState>(
          builder: (context, state) {
            print("=================");
            print("NAVIGATOR INGREDIENT CATEGORY STATE");
            print(state);
            print("=================");

            return Navigator(
              pages: [
                if (state is IngredientCategorieInitial)
                  MaterialPage(child: IngredientCategoryView()),
                if (state is IngredientCategorieLoadedState)
                  MaterialPage(child: IngredientCategoryView()),
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          },
        ),
      ),
    );
  }
}
