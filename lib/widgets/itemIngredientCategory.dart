import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/views/ingredient_by_categorie.dart';

class ItemIngredientCategory extends StatefulWidget {
  ItemIngredientCategory(this.ingredients_list) : super();

  var ingredients_list;

  @override
  State<ItemIngredientCategory> createState() => _ItemIngredientCategoryState();
}

class _ItemIngredientCategoryState extends State<ItemIngredientCategory> {
  IngredientCategoryRepository ingredientCategoryRepository = IngredientCategoryRepository();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: GestureDetector(
        onTap: () async {
          var ingredientCategorieList = await ingredientCategoryRepository.getById(widget.ingredients_list['id'].toString());

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IngredientByCategorieScreen(ingredient: ingredientCategorieList["results"]),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(border: Border.all(width: 2, color: Colors.red), borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  Uri.encodeFull('http://laravel_whats_for_dinner.test/${widget.ingredients_list['image']}'),
                  width: width * 0.15,
                  height: height * 0.15,
                ),
                width > 650 ? Text(widget.ingredients_list['name']) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
