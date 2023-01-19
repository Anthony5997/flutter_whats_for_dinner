import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/widgets/ingredientDialogue.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class IngredientByCategorieScreen extends StatefulWidget {
  IngredientByCategorieScreen({required this.ingredient, required this.category_name});

  List<Ingredient> ingredient;
  String category_name;
  @override
  State<IngredientByCategorieScreen> createState() => _IngredientByCategorieScreenState();
}

class _IngredientByCategorieScreenState extends State<IngredientByCategorieScreen> {
  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.category_name, style: TextStyle(fontSize: 24, fontFamily: secondeFontFamily),),
      ),
      body:  BlocProvider<IngredientCategorieBloc>(
        create: (context) => IngredientCategorieBloc()..add(IngredientListEventInitial(widget.ingredient)),
        child: ListView(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
          children: [
            Column(
            children: [
              Center(
                  child: SizedBox(
                    child: BlocBuilder<IngredientCategorieBloc, IngredientCategorieState>(builder: (context, state) {
                      if (state is IngredientListLoadedState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
                              child: Container(
                                width: width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Recherchez parmis les ingrédients ...',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (saisis) {
                                    print('First text field: $saisis');
                                     BlocProvider.of<IngredientCategorieBloc>(context).add(IngredientListOnChangeEvent(saisis, state.ingredientsInCategory ,state.ingredients));
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.88,
                              height: height * 0.865,
                              // decoration: styleBox(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                                child: Scrollbar(
                                  thumbVisibility: false,
                                  trackVisibility: false,
                                  thickness: 0,
                                  radius: const Radius.circular(10),
                                  interactive: false,
                                  controller: _scrollController,
                                  child: ListView(
                                    controller: _scrollController,
                                    children: [
                                      for (var i = 0; i < state.ingredients.length; i++)  ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Color.fromRGBO(120, 120, 120, 0),
                                          child: Image.network(Uri.encodeFull('http://laravel_whats_for_dinner.test/${state.ingredients[i].image}')),
                                        ),
                                        title: Text(state.ingredients[i].name.capitalise()),
                                        subtitle: Text(state.ingredients[i].name.capitalise()),
                                        trailing: AddIngredientButtonDialog(state.ingredients[i]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is IngredientListNoResultsState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                              child: Container(
                                width: width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Recherchez parmis les ingrédients ...',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (saisis) {
                                    print('First text field: $saisis');
                                    BlocProvider.of<IngredientCategorieBloc>(context).add(IngredientListOnChangeEvent(saisis, state.ingredientsInCategory ,state.ingredients));

                                  },
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                child: Text(
                                  "Aucun résultat",
                                  style: TextStyle(fontFamily: mainFontFamily, fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          height: height * 0.7,
                          child: const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Color(0xFFfffdf7),
                              color: Color(0xFFCA2525),
                            ),
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
      );
  }
}



extension Capitalise on String{
  String capitalise(){
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}