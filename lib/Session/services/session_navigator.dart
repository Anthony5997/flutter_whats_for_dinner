import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_view.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/screen/login_view.dart';
import 'package:flutter_whats_for_dinner/fridge/screens/fridge_view.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/views/ingredient_categorie_view.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_detail.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_favorite.dart';
import 'package:flutter_whats_for_dinner/recipe_list/screens/recipe_list_view.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen_session.dart';

class SessionNavigator extends StatefulWidget {
  @override
  State<SessionNavigator> createState() => _SessionNavigatorState();
  int _index = 0;
}

class _SessionNavigatorState extends State<SessionNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SessionBloc>(
        create: (context) => SessionBloc()..add(SessionPageSelectedEvent(widget._index)),
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            print("STATE NAV");
            print(state);
            return Navigator(
              pages: [
                if (state is SessionInitial) MaterialPage(child: FridgeScreen()),
                if (state is SessionLoadingState) MaterialPage(child: LoadingScreenSession()),
                if (state is SessionFavoriteState) MaterialPage(child: FavoriteRecipeListView()),
                if (state is SessionProfileState) MaterialPage(child: SessionView(state.userInfo, state.fridge)),
                if (state is SessionPageSelectedState) MaterialPage(child: LoadingScreen()),
                if (state is SessionIngredientCategoryState) MaterialPage(child: IngredientCategorieView()),
                if (state is SessionRecipeListState) MaterialPage(child: RecipeListView()),
                if (state is SessionRecipeState) MaterialPage(child: FridgeScreen()),
                if (state is LogoutState)
                  MaterialPage(
                    child: LoginView(formKey: GlobalKey<FormBuilderState>()),
                  ),
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          },
        ),
      ),
    );
  }
}
