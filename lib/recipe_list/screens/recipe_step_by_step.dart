import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/repository/recipe_list_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/itemRecipe.dart';

class StepByStepView extends StatefulWidget {
  const StepByStepView({Key? key}) : super(key: key);
  @override
  State<StepByStepView> createState() => _StepByStepViewState();
}

class _StepByStepViewState extends State<StepByStepView> {
  RecipeListRepository recipeListRepository = RecipeListRepository();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
        centerTitle: true,
      ),
      // backgroundColor: themeColor['principale'],
      drawer: CustomDrawer(),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeFavoriteListEvent()),
        child: BlocBuilder<RecipeListBloc, RecipeListState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        child: Column(
                          children: [
                            if (state is RecipeListFavoriteLoadedState)
                              Column(
                                children: [
                                  Container(
                                    width: width,
                                    height: state.recipeResult.length == 1 ? height * 0.50 : height * 0.8,
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
                                  Text("Aucune recette favorite pour l'instant !")
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
