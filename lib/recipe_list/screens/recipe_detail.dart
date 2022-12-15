import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_step_by_step.dart';
import 'package:flutter_whats_for_dinner/widgets/reviewDialogue.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class RecipeDetailView extends StatefulWidget {
  RecipeDetailView({Key? key, required this.recipe}) : super(key: key);
  Recipe recipe;
  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  final RecipeListRepository _recipeListRepository = RecipeListRepository();

  _toggleFavorite() {
    setState(() {
      widget.recipe.favorite = !widget.recipe.favorite;
      _recipeListRepository.favoriteToggle(widget.recipe.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.recipe.title,
          style: TextStyle(fontSize: 18, fontFamily: secondeFontFamily),
        ),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_outlined),
          ),
        ],
      ),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: BlocBuilder<RecipeListBloc, RecipeListState>(
          builder: (context, state) {
            return ListView(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                        width: width,
                        height: 250,
                        child: Image.network(
                          Uri.encodeFull('http://laravel_whats_for_dinner.test/${widget.recipe.image}'),
                          fit: BoxFit.cover,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: widget.recipe.favorite
                              ? Icon(
                                  Icons.favorite,
                                  color: primaryColor,
                                  size: 40,
                                )
                              : Icon(
                                  Icons.favorite_border_outlined,
                                  color: primaryColor,
                                  size: 40,
                                ),
                          tooltip: 'Ajouter au favoris',
                          onPressed: () {
                            _toggleFavorite();
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.recipe.title,
                            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 20),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 2),
                                child: Text(
                                  "pour ${widget.recipe.serving.toString()}",
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 14, fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Icon(Icons.person),
                            ],
                          ),
                        ],
                      ),
                      widget.recipe.global_rating != null
                          ? InkWell(
                              onTap: (() {
                                print('OK');
                              }),
                              child: Row(
                                children: [
                                  Text(
                                    "${widget.recipe.global_rating.toString()}",
                                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, fontFamily: secondeFontFamily),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color.fromARGB(255, 255, 226, 59),
                                    size: 20,
                                  ),
                                  Text(
                                    "(${widget.recipe.reviews_list.length.toString()})",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      fontFamily: secondeFontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              children: [
                                Text(
                                  "Aucun avis",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Icon(
                                  Icons.star_border_outlined,
                                  color: Color.fromARGB(255, 255, 226, 59),
                                  size: 22,
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
                Container(
                  width: width * 0.8,
                  child: Divider(
                    height: 5,
                    thickness: 2,
                    indent: 15,
                    endIndent: 15,
                    color: primaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Row(
                    children: [
                      widget.recipe.vegetarian
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(180, 103, 247, 110),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/vegetarien.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("végétarien"),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.recipe.vegan
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(180, 129, 199, 132),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/vegan.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("vegan"),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.recipe.gluten_free
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(248, 199, 134, 97),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/ble.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("Sans gluten"),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      widget.recipe.dairy_free
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(180, 66, 164, 245),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/lait.png',
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("sans produits laitiers"),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 18, right: 18, bottom: 20),
                  child: Text(
                    "Ingrédients :",
                    style: TextStyle(color: primaryColor),
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      for (var i = 0; i < widget.recipe.ingredients_list.length; i++)
                        Container(
                          width: 120,
                          margin: EdgeInsets.only(left: 14.0, right: 14, bottom: 5),
                          child: Column(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                margin: EdgeInsets.only(left: 14.0, right: 14, bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    Uri.encodeFull('http://laravel_whats_for_dinner.test/${widget.recipe.ingredients_list[i].image}'),
                                    width: 60,
                                    height: 80,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                  width: 170,
                                  height: 85,
                                  child: Text(
                                    widget.recipe.ingredients_list[i].name,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    maxLines: 6,
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                Divider(
                  height: 5,
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                  color: secondaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 18, right: 18, bottom: 5),
                  child: Container(
                    margin: const EdgeInsets.only(top: 5.0, bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(237, 236, 236, 236),
                    ),
                    padding: EdgeInsets.all(6),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 15),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                            child: Text(
                              "Préparation",
                              style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 20),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Text("Préparation"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/chronometre.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2.0),
                                          child: Text("${widget.recipe.preparation_minutes.toString()}m"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Text("Cuisson"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/cuisson.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 2.0),
                                          child: Text("${widget.recipe.cooking_minutes.toString()}m"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Text("Totale"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(6),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2.0),
                                            child: Text("${widget.recipe.ready_in_minutes.toString()}m"),
                                          ),
                                          Image.asset(
                                            'assets/images/icons/vegetarien.png',
                                            width: 20,
                                            height: 20,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 20),
                  child: Text(
                    "Réalisation",
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        for (var i = 0; i < widget.recipe.recipe_steps.length; i++)
                          Container(
                            width: width * 0.90,
                            margin: EdgeInsets.only(top: 15.0, bottom: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    widget.recipe.recipe_steps[i].step_number.toString(),
                                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 18),
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    maxLines: 3,
                                  ),
                                  SizedBox(
                                    width: width * 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.recipe.recipe_steps[i].step,
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                                        textAlign: TextAlign.start,
                                        softWrap: true,
                                        maxLines: 10,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 8),
                  child: Text(
                    "Laissez un avis pour cette recette! ",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ReviewDialog(widget.recipe),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
