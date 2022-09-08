import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({Key? key}) : super(key: key);

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomBottomNavigationBar(),
      body: BlocProvider<FridgeBloc>(
        create: (context) => FridgeBloc()..add(FridgeLoadingEvent()),
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<FridgeBloc, FridgeState>(
                builder: (context, state) {
                  print("STATE");
                  print(state);
                  if (state is FridgeLoadedState) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.fridge.ingredients_list.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(state.fridge.ingredients_list[index].id),
                          color: Colors.red[900],
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: new BoxDecoration(border: new Border(right: new BorderSide(width: 1.0, color: Colors.white24))),
                              child: Icon(Icons.autorenew, color: Colors.white),
                            ),
                            title: Text(
                              state.fridge.ingredients_list[index].name,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                            subtitle: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.linear_scale,
                                  color: Colors.yellowAccent,
                                ),
                                Text(
                                  state.fridge.ingredients_list[index].quantity.toString() + state.fridge.ingredients_list[index].unit_name.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.white,
                                size: 26,
                              ),
                              tooltip: 'Supprimer du frigo',
                              onPressed: () {
                                print("Ingrédient supprimé : ${state.fridge.ingredients_list[index].id}");
                                context.read<FridgeBloc>().add(FridgeDeleteIngredientEvent(ingredientId: state.fridge.ingredients_list[index].id));
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  } else if (state is FridgeEmptyState) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                        child: Text(
                          "Votre frigo est vide, remplisser le !",
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
                child: const Text('Ajouter ingrédient'),
                onPressed: () {
                  BlocProvider.of<SessionBloc>(context).add(SessionIngredientCategoryEvent());
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
