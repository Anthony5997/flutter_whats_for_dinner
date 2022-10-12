import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';

class ItemIngredient extends StatefulWidget {
  ItemIngredient(List<Ingredient> this.ingredients_list, int this.index) : super();

  List<Ingredient> ingredients_list;
  int index;

  @override
  State<ItemIngredient> createState() => _ItemIngredientState();
}

class _ItemIngredientState extends State<ItemIngredient> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 8,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: Color.fromARGB(255, 112, 29, 23),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: const EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(border: new Border(right: BorderSide(width: 1.0, color: Colors.white24))),
          child: Image.network(Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/ingredients/${widget.ingredients_list[widget.index].image}')),
        ),
        title: Text(
          widget.ingredients_list[widget.index].name,
          style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: <Widget>[
            Icon(
              Icons.public_rounded,
              color: Colors.red[900],
            ),
            Text(
              widget.ingredients_list[widget.index].quantity.toString() + widget.ingredients_list[widget.index].unit_name.toString(),
              style: TextStyle(
                color: Colors.red[900],
              ),
            )
          ],
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
            size: 26,
          ),
          tooltip: 'Supprimer du frigo',
          onPressed: () {
            context.read<FridgeBloc>().add(FridgeDeleteIngredientEvent(ingredientId: widget.ingredients_list[widget.index].id));
          },
        ),
      ),
    );
  }
}
