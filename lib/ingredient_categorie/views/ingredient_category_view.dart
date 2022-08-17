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
        alignment: Alignment.center,
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Liste des catégories d'ingrédient",
                style: TextStyle(
                  fontFamily: "FruitPunch",
                  fontSize: 20,
                ),
              ),
            ),
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
