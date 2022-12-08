import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_detail.dart';
import 'package:flutter_whats_for_dinner/widgets/ingredientManquantDialogue.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/customSnackbar.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:swipe_to/swipe_to.dart';

class ItemRecipeFavorite extends StatefulWidget {
  ItemRecipeFavorite(Recipe this.recipe) : super();

  Recipe recipe;

  @override
  State<ItemRecipeFavorite> createState() => _ItemRecipeFavoriteState();
}

class _ItemRecipeFavoriteState extends State<ItemRecipeFavorite> {
  final ScrollController _scrollController = ScrollController();
  final RecipeListRepository _recipeListRepository = RecipeListRepository();

  bool _visibilityCard = true;

  _toggleFavorite() {
    setState(() {
      widget.recipe.favorite = !widget.recipe.favorite;
      _recipeListRepository.favoriteToggle(widget.recipe.id);
      _visibilityCard = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.recipe.image);
    double pertinenceRatio = 0;
    if (widget.recipe.pertinence <= 9) {
      pertinenceRatio = double.parse('0.0${widget.recipe.pertinence}');
    } else {
      pertinenceRatio = double.parse('0.${widget.recipe.pertinence}');
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: _visibilityCard,
      child: SwipeTo(
        onRightSwipe: () {
          _toggleFavorite();
          BlocProvider.of<RecipeListBloc>(context).add(RecipeFavoriteListEvent());
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "Recette retiré", primaryColor));
        },
        child: GestureDetector(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetailView(recipe: widget.recipe),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 8), // changes position of shadow
                  ),
                ],
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
                          Uri.encodeFull('http://laravel_whats_for_dinner.test/${widget.recipe.image}'),
                          width: width > 500 ? 220.0 : width * 0.38,
                          height: 210.0,
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
                                          color: primaryColor,
                                          size: 24,
                                        )
                                      : Icon(
                                          Icons.favorite_border_outlined,
                                          color: primaryColor,
                                          size: 24,
                                        ),
                                  tooltip: 'Ajouter au favoris',
                                  onPressed: () {
                                    _toggleFavorite();
                                    BlocProvider.of<RecipeListBloc>(context).add(RecipeFavoriteListEvent());
                                    ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "Recette retirée", primaryColor));
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2, bottom: 4, left: 4, right: 0),
                              child: widget.recipe.global_rating != null
                                  ? Row(
                                      children: [
                                        Text(
                                          widget.recipe.global_rating.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromARGB(255, 255, 226, 59),
                                          size: 20,
                                        ),
                                        Text(
                                          widget.recipe.reviews_list != null ? "(${widget.recipe.reviews_list.length.toString()})" : "(0)",
                                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Text(
                                          "Aucun avis pour l'instant",
                                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, fontStyle: FontStyle.italic),
                                        ),
                                        Icon(
                                          Icons.star_border_outlined,
                                          color: Color.fromARGB(255, 255, 226, 59),
                                          size: 22,
                                        ),
                                        Text(
                                          widget.recipe.reviews_list != null ? "(${widget.recipe.reviews_list.length.toString()})" : "(0)",
                                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                                        ),
                                      ],
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 4, left: 4, right: 0),
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
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(children: [
                                widget.recipe.ingredients_missing_list.length != 0
                                    ? Text("Manquants : ${widget.recipe.ingredients_missing_list.length}",
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
                                    : MissingIngredientButtonDialog(widget.recipe.ingredients_missing_list),
                              ]),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          widget.recipe.preparation_minutes.toString(),
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
                                          style: TextStyle(fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10.0),
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
                              style: TextStyle(fontFamily: secondeFontFamily, fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                            ),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: primaryColor,
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
        ),
      ),
    );
  }
}
