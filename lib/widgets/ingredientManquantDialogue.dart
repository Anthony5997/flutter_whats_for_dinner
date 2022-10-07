import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/quantity_field.dart';
import 'package:select_form_field/select_form_field.dart';

class MissingIngredientButtonDialog extends StatelessWidget {
  MissingIngredientButtonDialog(this.ingredients);
  List<Ingredient> ingredients;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.info_outlined,
      ),
      tooltip: 'Voir plus',
      onPressed: () => _showMyDialog(context, ingredients),
    );
  }
}

Future<void> _showMyDialog(context, ingredients) async {
  print("ingredients ICI");
  print(ingredients[0].image);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      print(ingredients[0]);
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close_outlined),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(children: [
            for (var i = 0; i < ingredients.length; i++)
              Container(
                child: Row(
                  children: [
                    Image.network(
                      Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/ingredients/${ingredients[i].image}'),
                      width: 35,
                      height: 35,
                    ),
                    Expanded(
                      child: Container(
                          child: Text(
                        ingredients[i].name,
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                    ),
                  ],
                ),
              ),
          ]),
        ),
      );
    },
  );
}
