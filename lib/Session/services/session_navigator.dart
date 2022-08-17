import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/screen/login_view.dart';
import 'package:flutter_whats_for_dinner/fridge/screens/fridge_view.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/services/ingredient_category_navigator.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class SessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenu ")),
      endDrawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: LigthTheme.themedata.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/Logo-genial.png',
                    height: 100,
                  ),
                  const Text(
                    'Paramètres',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "LemonDays",
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Mes préférences',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "LemonDays",
                  fontSize: 12,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text(
                'Déconnexion',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "LemonDays",
                  fontSize: 12,
                ),
              ),
              onTap: () {
                context.read<AuthenticationBloc>().add(LogoutEvent());
              },
            ),
          ],
        ),
      ),
      body: BlocProvider<SessionBloc>(
        create: (context) =>
            SessionBloc()..add(SessionPageSelectedEvent(index: 1)),
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            print("=================");
            print("NAVIGATOR SESSION STATE");
            print(context);
            print("=================");

            return Navigator(
              pages: [
                if (state is SessionInitial)
                  MaterialPage(child: FridgeScreen()),
                if (state is PageLoadingState)
                  MaterialPage(child: LoadingScreen()),
                if (state is SessionPageSelectedState)
                  MaterialPage(child: LoadingScreen()),
                if (state is SessionIngredientCategoryState)
                  MaterialPage(child: IngredientCategoryNavigator()),
                if (state is SessionRecipeState)
                  MaterialPage(child: FridgeScreen()),
                if (state is LogoutState)
                  MaterialPage(
                      child: LoginView(formKey: GlobalKey<FormBuilderState>())),
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Frigo",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive, color: Colors.black),
            label: "Recette",
          ),
        ],
        onTap: (index) => context
            .read<SessionBloc>()
            .add(SessionPageSelectedEvent(index: index)),
      ),
    );
  }
}
