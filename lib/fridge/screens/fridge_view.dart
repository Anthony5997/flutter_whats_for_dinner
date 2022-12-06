import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/itemIngredient.dart';

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({Key? key}) : super(key: key);

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon frigo'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Vider le frigo"),
                onTap: () => {
                  BlocProvider.of<FridgeBloc>(context).add(FridgeDeleteAllIngredientsEvent()),
                },
              ),
            ],
          ),
        ],
      ),
      // backgroundColor: themeColor['principale'],
      drawer: CustomDrawer(),
      body: BlocProvider<FridgeBloc>(
        create: (context) => FridgeBloc()..add(FridgeLoadingEvent()),
        child: ListView(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
          children: <Widget>[
            Column(
              children: [
                Center(
                  child: SizedBox(
                    child: BlocBuilder<FridgeBloc, FridgeState>(builder: (context, state) {
                      if (state is FridgeLoadedState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 20),
                              child: Container(
                                width: width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Recherchez dans votre frigo ...',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (saisis) {
                                    print('First text field: $saisis');
                                    BlocProvider.of<FridgeBloc>(context).add(FridgeOnChangeEvent(saisis: saisis, fridge: state.fridge, ingredients_list: state.fridge.ingredients_list));
                                  },
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.88,
                              height: state.fridge.ingredients_list.length == 1 ? height * 0.30 : height * 0.65,
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
                                      for (var i = 0; i < state.ingredient_list.length; i++) ItemIngredient(state.ingredient_list, i, state.units),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is FridgeEmptyState) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                child: Image.asset(
                                  'assets/images/empty-fridge.png',
                                  width: width > 550 ? 400 : 300,
                                  height: width > 550 ? 400 : 300,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                child: Text(
                                  "Votre frigo est vide, remplisser le !",
                                  style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (state is FridgeNoResultsState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                              child: Container(
                                width: width * 0.85,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Recherchez dans votre frigo ...',
                                    suffixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (saisis) {
                                    print('First text field: $saisis');
                                    BlocProvider.of<FridgeBloc>(context).add(FridgeOnChangeEvent(saisis: saisis, fridge: state.fridge, ingredients_list: state.fridge.ingredients_list));
                                  },
                                ),
                              ),
                            ),
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                                child: Text(
                                  "Aucun résultat",
                                  style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
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
                // SizedBox(height: height * 0.10),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    child: const Text('Ajouter ingrédient'),
                    onPressed: () {
                      BlocProvider.of<SessionBloc>(context).add(SessionIngredientCategoryEvent());
                    },
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
