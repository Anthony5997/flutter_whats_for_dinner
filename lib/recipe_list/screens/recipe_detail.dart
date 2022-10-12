import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';

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
          style: TextStyle(fontSize: 18),
        ),
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_outlined),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(146, 253, 171, 64),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: BlocBuilder<RecipeListBloc, RecipeListState>(
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                          width: width,
                          height: 250,
                          child: Image.network(
                            Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/recipe/${widget.recipe.image}'),
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            icon: widget.recipe.favorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 40,
                                  )
                                : Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.red,
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
                    padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 15),
                    child: Text(
                      widget.recipe.title,
                      style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.w400, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    indent: 5,
                    endIndent: 5,
                    color: Color.fromARGB(161, 211, 0, 0),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 20),
                      child: Text(
                        "Description :",
                        style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.w400, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  Row(
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
                                color: Color.fromARGB(181, 172, 162, 74),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 8, right: 8, bottom: 20),
                    child: Text(
                      "Ingrédients :",
                      style: TextStyle(color: Colors.red[900]),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 220,
                    width: width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (var i = 0; i < widget.recipe.ingredients_list.length; i++)
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(left: 14.0, right: 14, bottom: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  margin: EdgeInsets.only(left: 14.0, right: 14, bottom: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/ingredients/${widget.recipe.ingredients_list[i].image}'),
                                      width: 60,
                                      height: 80,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                    width: 170,
                                    height: 100,
                                    child: Text(
                                      widget.recipe.ingredients_list[i].name,
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      maxLines: 6,
                                    )),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                    thickness: 2,
                    indent: 50,
                    endIndent: 50,
                    color: Color.fromARGB(162, 158, 158, 158),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 236, 236, 236),
                      ),
                      padding: EdgeInsets.all(6),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 15),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                "Préparation",
                                style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.w400, fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
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
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Réalisation",
                      style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.w400, fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: ElevatedButton(
                      child: const Text('Au fourneaux !'),
                      onPressed: () {
                        print("futur mode réalisation");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange[100],
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
                                      style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.bold, fontSize: 18),
                                      textAlign: TextAlign.start,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
