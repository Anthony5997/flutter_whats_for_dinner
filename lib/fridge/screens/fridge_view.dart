import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';

class FridgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Votre frigo',
                style: TextStyle(
                  fontFamily: "FruitPunch",
                  fontSize: 20,
                ),
              ),
            ),
            // TextButton(
            //   child: const Text('sign out'),
            //   onPressed: () =>
            //       context.read<AuthenticationBloc>().add(LogoutEvent()),
            // ),
            ElevatedButton(
              child: const Text('Ajouter ingrédient'),
              onPressed: () {
                context
                    .read<IngredientCategorieBloc>()
                    .add(IngredientCategorieInitialEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
