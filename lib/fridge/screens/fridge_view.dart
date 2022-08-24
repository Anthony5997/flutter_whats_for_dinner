import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen_session.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';

class FridgeScreen extends StatefulWidget {
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
                    print(state.fridge[0]['name']);

                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.fridge.length,
                        itemBuilder: (context, index) => Card(
                          key: ValueKey(state.fridge[index]["id"]),
                          color: Colors.amberAccent,
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              state.fridge[index]["ingredient_id"].toString(),
                              style: const TextStyle(fontSize: 24),
                            ),
                            // Image.network('http://laravel_whats_for_dinner.test/public/assets/ingredients/${state.fridge[index]["image"]}'),

                            title: Text(state.fridge[index]['name']),
                            subtitle: Text(state.fridge[index]["category_name"]),
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                                size: 35,
                              ),
                              tooltip: 'Supprimer du frigo',
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      // ListView(
                      //   children: [
                      //     for (var i = 0; i < 5; i++) Text("Salut $i"),
                      //   ],
                      // ),
                    );
                  } else if (state is FridgeEmptyState) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 12),
                        child: Text(
                          "Votre frigo est vide, remplisser le !",
                          style: TextStyle(fontFamily: "LemonDays", fontSize: 24),
                        ),
                      ),
                    );
                  } else {
                    return Center(
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
