import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/itemIngredientCategory.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class IngredientCategorieView extends StatelessWidget {
  const IngredientCategorieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => BlocProvider.of<SessionBloc>(context).add(SessionPageSelectedEvent(0)),
        ),
        title: Text("Catégories d'ingrédient", style: TextStyle(fontSize: 24, fontFamily: secondeFontFamily),),

      ),
      body: BlocProvider<IngredientCategorieBloc>(
        create: (context) => IngredientCategorieBloc()..add(IngredientCategorieLoadingEvent()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<IngredientCategorieBloc, IngredientCategorieState>(
              builder: (context, state) {
                if (state is IngredientCategorieLoadedState) {
                  return Expanded(
                    child: GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        primary: false,
                        padding: const EdgeInsets.all(1),
                        children: <Widget>[
                          for (var i = 0; i < state.ingredientCat.length; i++) ItemIngredientCategory(state.ingredientCat[i]),
                        ]),
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
