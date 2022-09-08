import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/views/ingredient_by_categorie.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';

class IngredientCategorieView extends StatelessWidget {
  const IngredientCategorieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IngredientCategoryRepository ingredientCategoryRepository = IngredientCategoryRepository();
    return Scaffold(
      endDrawer: CustomBottomNavigationBar(),
      body: BlocProvider<IngredientCategorieBloc>(
        create: (context) => IngredientCategorieBloc()..add(IngredientCategorieLoadingEvent()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<IngredientCategorieBloc, IngredientCategorieState>(
              builder: (context, state) {
                print("STATE");
                print(state);
                if (state is IngredientCategorieLoadedState) {
                  print(state.ingredientCat);
                  return Expanded(
                      child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                    itemCount: state.ingredientCat.length,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(border: Border.all(width: 5, color: Colors.red), borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              print(state.ingredientCat[index]['id'].toString());
                              var ingredientCategorieList = await ingredientCategoryRepository.getById(state.ingredientCat[index]['id'].toString());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => IngredientByCategorieScreen(ingredient: ingredientCategorieList["results"]),
                                ),
                              );
                            },
                            child: Text(state.ingredientCat[index]['name']),
                          ),
                        ),
                      );
                    },
                  )

                      // ListView(
                      //   children: [
                      //     for (var i = 0; i < state.ingredientCat['total_results']; i++)

                      //   ],
                      // ),
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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
