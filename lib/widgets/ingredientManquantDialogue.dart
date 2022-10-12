import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';

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
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
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
