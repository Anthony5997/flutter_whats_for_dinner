import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_detail.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  RecipeListRepository recipeListRepository = RecipeListRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromARGB(255, 233, 229, 215),
      endDrawer: CustomBottomNavigationBar(),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                child: Container(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  ),
                ),
              ),

              BlocBuilder<RecipeListBloc, RecipeListState>(
                builder: (context, state) {
                  print("STATE");
                  print(state);
                  if (state is RecipeListLoadedState) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 250,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                                color: Colors.white,
                              ),
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  ListView.separated(
                                    separatorBuilder: (context, index) => Divider(
                                      thickness: 3,
                                    ),
                                    itemCount: state.recipeResult.length,
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        // return the header
                                        return Container(
                                          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                                          alignment: Alignment.topLeft,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Text(
                                            "Nos résultats",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.red[800],
                                            ),
                                          ),
                                          width: double.infinity,
                                        );
                                      }
                                      index -= 1;
                                      var pertinenceRatio = double.parse('0.${state.recipeResult[index].pertinence}');

                                      return GestureDetector(
                                        onTap: () async {
                                          print("Container clicked");
                                          print(state.recipeResult[index].id.toString());
                                          print(state.recipeResult[index].pertinence.toString());
                                          print(state.recipeResult[index].ingredients_missing_list);
                                          print(pertinenceRatio);

                                          // var recipedetail = await recipeListRepository.getOne(state.recipeResult[index].id.toString());
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
                                                        Uri.encodeFull('http://laravel_whats_for_dinner.test/assets/recipe/${state.recipeResult[index].image}'),
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
                                                                state.recipeResult[index].title,
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
                                                              // state.recipeResult[index].ingredients_list.forEach(
                                                              // for (var result in state.recipeResult[index].ingredients_list) Text(result.category_id.toString()),
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
                                                            child: Text("Ingredient manquant : ${state.recipeResult[index].ingredients_missing_list.length}"),
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
                                                                      Text(state.recipeResult[index].preparation_minutes.toString()),
                                                                      const Icon(Icons.punch_clock),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 50,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(state.recipeResult[index].cooking_minutes.toString()),
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
                                                            "${state.recipeResult[index].pertinence.toString()}%",
                                                            style: const TextStyle(fontFamily: "LemonDays", fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
                                                          ),
                                                          linearStrokeCap: LinearStrokeCap.roundAll,
                                                          progressColor: Colors.redAccent,
                                                        ),
                                                      ),
                                                      state.recipeResult[index].pertinence == 100
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
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Positioned(
                        //   left: MediaQuery.of(context).size.width / 3,
                        //   top: 750,
                        //   child: SizedBox(
                        //     child: Container(
                        //       alignment: Alignment.center,
                        //       child: ElevatedButton(
                        //         child: const Text('Recherchez à nouveau !'),
                        //         onPressed: () {
                        //           BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
                        //         },
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  } else if (state is RecipeListInitial) {
                    return Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                            child: Text(
                              "Aucune recette pour l'instant !",
                              style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Recherchez pour moi !'),
                          onPressed: () {
                            print("taped");
                            BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
                          },
                        ),
                      ],
                    );
                  } else if (state is RecipeListEmptyState) {
                    return Column(
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                            child: Text(
                              "Aucune recette pour l'instant !",
                              style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Recherchez pour moi !'),
                          onPressed: () {
                            BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
                          },
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xFFfffdf7),
                        color: Color(0xFFCA2525),
                      ),
                    );
                  }
                },
              ),
              // Container(
              //   alignment: Alignment.center,
              //   child: ElevatedButton(
              //     child: const Text('Recherchez à nouveau !'),
              //     onPressed: () {
              //       BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
