import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/itemRecipe.dart';

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
        title: const Text('Recette'),
        centerTitle: true,
      ),
      // backgroundColor: themeColor['principale'],
      drawer: CustomDrawer(),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: BlocBuilder<RecipeListBloc, RecipeListState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                      child: Container(
                        width: width * 0.85,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Recherchez parmis toutes nos recette ...',
                            suffixIcon: Icon(Icons.search),
                          ),
                          onChanged: (saisis) {
                            print('First text field: $saisis');
                            BlocProvider.of<RecipeListBloc>(context).add(RecipeListOnChangeEvent(
                              saisis: saisis,
                            ));
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        child: Column(
                          children: [
                            if (state is RecipeListLoadedState)
                              Column(
                                children: [
                                  Container(
                                    width: width * 0.9,
                                    height: state.recipeResult.length == 1 ? height * 0.50 : height * 0.75,
                                    // decoration: styleBox(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0, bottom: 8, left: 8, right: 8),
                                      child: ListView(
                                        children: [
                                          for (var i = 0; i < state.recipeResult.length; i++) ItemRecipe(state.recipeResult[i]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            if (state is RecipeListEmptyState)
                              Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                      child: Image.asset(
                                        'assets/images/cooking-pot.png',
                                        width: width > 550 ? 400 : 300,
                                        height: width > 550 ? 400 : 300,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: const Text("What's for dinner ?"),
                                    onPressed: () {
                                      BlocProvider.of<RecipeListBloc>(context).add(RecipeListLoadingEvent());
                                    },
                                  ),
                                ],
                              ),
                            if (state is RecipeListLoadingState)
                              Container(
                                height: height * 0.8,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Color(0xFFfffdf7),
                                    color: Color(0xFFCA2525),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
