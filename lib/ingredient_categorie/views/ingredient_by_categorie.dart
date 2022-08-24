import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/models/IngredientCategory.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IngredientByCategorieScreen extends StatelessWidget {
  // In the constructor, require a Todo.
  const IngredientByCategorieScreen({required this.ingredient});

  // Declare a field that holds the Todo.
  final ingredient;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    print("ingredient dans widget");
    print(ingredient);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: Text(
          "Ajouter un ingredient",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ingredient.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(ingredient[index]["id"].toString()),
              ),
              title: Text(ingredient[index]["name"]),
              subtitle: Text(ingredient[index]["name"]),
              trailing: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  color: Colors.red,
                  size: 35,
                ),
                tooltip: 'Ajouter au frigo',
                onPressed: () {},
              ),
            );
            // ListTile(
            //   title: Text(ingredient[index]["name"]),
            //   // When a user taps the ListTile, navigate to the DetailScreen.
            //   // Notice that you're not only creating a DetailScreen, you're
            //   // also passing the current todo through to it.
            //
            // );
          },
        ),
      ),
    );
  }
}
