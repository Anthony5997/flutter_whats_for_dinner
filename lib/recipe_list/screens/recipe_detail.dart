import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecipeDetailView extends StatefulWidget {
  const RecipeDetailView({Key? key}) : super(key: key);

  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
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
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
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
                  if (state is RecipeDetailLoadedState) {
                    return SizedBox(
                      height: 720,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          child: Padding(padding: const EdgeInsets.all(8.0), child: Container()),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
