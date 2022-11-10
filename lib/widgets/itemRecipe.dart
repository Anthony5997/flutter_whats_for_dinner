import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_detail.dart';
import 'package:flutter_whats_for_dinner/widgets/ingredientManquantDialogue.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemRecipe extends StatefulWidget {
  ItemRecipe(Recipe this.recipe) : super();

  Recipe recipe;

  @override
  State<ItemRecipe> createState() => _ItemRecipeState();
}

class _ItemRecipeState extends State<ItemRecipe> {
  final ScrollController _scrollController = ScrollController();
  final RecipeListRepository _recipeListRepository = RecipeListRepository();

  _toggleFavorite() {
    setState(() {
      widget.recipe.favorite = !widget.recipe.favorite;
      _recipeListRepository.favoriteToggle(widget.recipe.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    double pertinenceRatio = 0;
    if (widget.recipe.pertinence <= 9) {
      pertinenceRatio = double.parse('0.0${widget.recipe.pertinence}');
    } else {
      pertinenceRatio = double.parse('0.${widget.recipe.pertinence}');
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailView(recipe: widget.recipe),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      Uri.encodeFull(
                          'http://laravel_whats_for_dinner.test/${widget.recipe.image}'),
                      width: width > 500 ? 220.0 : width * 0.38,
                      height: 180.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Text(
                              widget.recipe.title,
                              style: TextStyle(
                                fontSize: width > 550 ? 16 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            IconButton(
                              icon: widget.recipe.favorite
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 24,
                                    )
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                              tooltip: 'Ajouter au favoris',
                              onPressed: () {
                                _toggleFavorite();
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8, bottom: 8, left: 4, right: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (var i = 0; i < 4; i++)
                                Text(
                                  widget.recipe.ingredients_list[i].name,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(children: [
                            widget.recipe.ingredients_missing_list.length != 0
                                ? Text(
                                    "Manquants : ${widget.recipe.ingredients_list.length}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ))
                                : Text(
                                    "Prêt !",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                            widget.recipe.ingredients_missing_list.length == 0
                                ? Icon(
                                    Icons.check,
                                    color: Colors.green[800],
                                  )
                                : MissingIngredientButtonDialog(
                                    widget.recipe.ingredients_missing_list),
                          ]),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.recipe.preparation_minutes
                                          .toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Icon(Icons.access_time),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      widget.recipe.cooking_minutes.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Icon(Icons.gas_meter_outlined),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Pertinence :",
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: LinearPercentIndicator(
                        width: width < 800 ? width * 0.58 : width * 0.6,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: pertinenceRatio,
                        center: Text(
                          "${widget.recipe.pertinence.toString()}%",
                          style: const TextStyle(
                              fontFamily: "LemonDays",
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.redAccent,
                      ),
                    ),
                    widget.recipe.pertinence == 100
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
