import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ItemRecipe extends StatefulWidget {
  ItemRecipe(Recipe this.recipe) : super();

  Recipe recipe;

  @override
  State<ItemRecipe> createState() => _ItemRecipeState();
}

class _ItemRecipeState extends State<ItemRecipe> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double pertinenceRatio = 0;
    if (widget.recipe.pertinence < 9) {
      pertinenceRatio = double.parse('0.0${widget.recipe.pertinence}');
    } else {
      pertinenceRatio = double.parse('0.${widget.recipe.pertinence}');
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        print("Container clicked");
        print(widget.recipe.id.toString());
        print(widget.recipe.ingredients_missing_list);
        print("PERTINENCE : ${widget.recipe.pertinence.toString()}");
        print("PERTINENCE RATIO : $pertinenceRatio");

        // var recipedetail = await recipeListRepository.getOne(widget.recipe.id.toString());
        // print("DETAIL PLEASE");
        // print(recipedetail);

        // BlocProvider.of<RecipeListBloc>(context).add(Recipe());

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => RecipeDetailView(),
        //   ),
        // );
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
          // height: 200,
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
                      Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/recipe/${widget.recipe.image}'),
                      width: 220.0,
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
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            IconButton(
                              icon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24,
                              ),
                              tooltip: 'Ajouter au favoris',
                              onPressed: () {
                                print("TEST FAV");
                              },
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            // widget.recipe.ingredients_list.forEach(
                            // for (var result in widget.recipe.ingredients_list) Text(result.category_id.toString()),
                            //   (result) => {
                            // print(result),
                            //   },
                            // ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'test',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, right: 8, bottom: 8),
                              child: Text(
                                'test',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'test',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'test',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text("Ingredient manquant : ${widget.recipe.ingredients_missing_list.length}/${widget.recipe.ingredients_list.length}"),
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
                                    Text(widget.recipe.preparation_minutes.toString()),
                                    const Icon(Icons.punch_clock),
                                  ],
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Row(
                                  children: [
                                    Text(widget.recipe.cooking_minutes.toString()),
                                    const Icon(Icons.fireplace_outlined),
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
                        width: MediaQuery.of(context).size.width - 400,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: pertinenceRatio,
                        center: Text(
                          "${widget.recipe.pertinence.toString()}%",
                          style: const TextStyle(fontFamily: "LemonDays", fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
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
