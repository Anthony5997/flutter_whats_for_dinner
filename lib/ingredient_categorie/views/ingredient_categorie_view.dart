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
    IngredientCategoryRepository ingredientCategoryRepository =
        IngredientCategoryRepository();
    return Scaffold(
      endDrawer: CustomBottomNavigationBar(),
      body: BlocProvider<IngredientCategorieBloc>(
        create: (context) =>
            IngredientCategorieBloc()..add(IngredientCategorieLoadingEvent()),
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
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 500,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: state.ingredientCat.length,
                      itemBuilder: (BuildContext context, index) {
                        return TextButton(
                          onPressed: () async {
                            print(state.ingredientCat[index]['id'].toString());
                            var ingredientCategorieList =
                                await ingredientCategoryRepository.getById(state
                                    .ingredientCat[index]['id']
                                    .toString());

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    IngredientByCategorieScreen(
                                        ingredient:
                                            ingredientCategorieList["results"]),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 20),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.red),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  SizedBox(
                                    child: Image.network(
                                      Uri.encodeFull(
                                          'http://laravel_whats_for_dinner.test/assets/categories/${state.ingredientCat[index]['image']}'),
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    width: 150,
                                    height: 150,
                                  ),
                                  Text(state.ingredientCat[index]['name']),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
