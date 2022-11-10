import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/widgets/ingredientDialogue.dart';

class IngredientByCategorieScreen extends StatelessWidget {
  IngredientByCategorieScreen({required this.ingredient});

  final ingredient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: ingredient.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color.fromRGBO(120, 120, 120, 0),
                      child: Image.network(Uri.encodeFull(
                          'http://laravel_whats_for_dinner.test/${ingredient[index]["image"]}')),
                    ),
                    title: Text(ingredient[index]["name"]),
                    subtitle: Text(ingredient[index]["name"]),
                    trailing: AddIngredientButtonDialog(ingredient[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
