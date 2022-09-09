import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({Key? key}) : super(key: key);

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomBottomNavigationBar(),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListLoadingEvent()),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<RecipeListBloc, RecipeListState>(
                builder: (context, state) {
                  print("STATE");
                  print(state);
                  if (state is RecipeListLoadedState) {
                    return Expanded(
                      child: Container(
                        child: Center(
                            child: Column(
                          children: [
                            Text("La il y aura des recettes chargé"),
                            Text("La il y aura des recettes chargé"),
                            Text("La il y aura des recettes chargé"),
                            Text("La il y aura des recettes chargé"),
                          ],
                        )),
                      ),
                    );
                  } else if (state is RecipeListEmptyState) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                        child: Text(
                          "Aucune recette pour l'instant !",
                          style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
                        ),
                      ),
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
              ElevatedButton(
                child: const Text('Recherchez pour moi !'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
