import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Recipe.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RecipeDetailView extends StatefulWidget {
  RecipeDetailView({Key? key, required this.recipe}) : super(key: key);
  Recipe recipe;
  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.close_outlined),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 233, 229, 215),
      body: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc()..add(RecipeListEventInitial()),
        child: BlocBuilder<RecipeListBloc, RecipeListState>(
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Column(
                  children: [
                    Center(
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            Uri.encodeFull(
                                'http://laravel_whats_for_dinner.test/assets/recipe/${widget.recipe.image}'),
                            width: width < 550 ? 220.0 : width * 0.8,
                            height: width < 550 ? 220.0 : height * 0.4,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          widget.recipe.title,
                          style: TextStyle(color: Colors.red[900]),
                          textAlign: TextAlign.start,
                        ),
                        // ListView(
                        //   // This next line does the trick.
                        //   scrollDirection: Axis.horizontal,
                        //   children: <Widget>[
                        //     for (var i = 0;
                        //         i < widget.recipe.ingredients_list.length;
                        //         i++)
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Container(
                        //           width: 160.0,
                        //           color: Colors.orange,
                        //           child: ClipRRect(
                        //             borderRadius: BorderRadius.circular(8.0),
                        //             child: Image.network(
                        //               Uri.encodeFull(
                        //                   'http://laravel_whats_for_dinner.test/assets/ingredients/${widget.recipe.image}'),
                        //               width: width * 0.12,
                        //               height: height * 0.12,
                        //               fit: BoxFit.fill,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //   ],
                        // ),
                      ]),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
