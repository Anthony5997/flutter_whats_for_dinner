import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngredientCategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final Future<SharedPreferences> _userPreferences =
    //     SharedPreferences.getInstance();

    final IngredientCategoryRepository ingredientCategoryRepository =
        IngredientCategoryRepository();

    Future<dynamic> ingredientCategory = ingredientCategoryRepository.get();

    print("INGREDIENT VIEW FOR GET CAT");
    print(ingredientCategory);
    print("===========================");

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('ingredientCategory View'),
            ElevatedButton(
              child: const Text('Retour au Frigo'),
              onPressed: () =>
                  context.read<SessionBloc>().add(SessionFridgeEvent()),
            ),
          ],
        ),
      ),
    );
  }
}
