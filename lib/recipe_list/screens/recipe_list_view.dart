import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/itemRecipe.dart';
import 'package:flutter_whats_for_dinner/widgets/itemRecipeDetails.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon frigo'),
        centerTitle: true,
      ),
      // backgroundColor: themeColor['principale'],
      drawer: CustomDrawer(),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: SizedBox(
                    child: BlocBuilder<RecipeListBloc, RecipeListState>(builder: (context, state) {
                      if (state is RecipeListLoadedState) {
                        return Column(
                          children: [
                            Container(
                              width: width * 0.85,
                              height: state.recipeResult.length == 1 ? height * 0.30 : height * 0.8,
                              // decoration: styleBox(),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 0),
                                child: ListView(
                                  children: [
                                    for (var i = 0; i < state.recipeResult.length; i++) ItemRecipe(state.recipeResult[i]),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                child: const Text('Recherchez à nouveau !'),
                                onPressed: () {
                                  BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
                                },
                              ),
                            ),
                          ],
                        );
                      } else if (state is RecipeListEmptyState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                              child: Container(
                                width: width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Recherchez parmis nos recette ...',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                child: Image.asset(
                                  'assets/images/cooking-pot.png',
                                  width: width * 0.7,
                                  height: height * 0.6,
                                  fit: BoxFit.fill,
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
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
