import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/screen/login_view.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/fridge/screens/fridge_view.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/views/ingredient_categorie_view.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen_session.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class SessionNavigator extends StatefulWidget {
  @override
  State<SessionNavigator> createState() => _SessionNavigatorState();
  int _index = 0;
}

class _SessionNavigatorState extends State<SessionNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenu ")),
      endDrawer: CustomDrawer(),
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
                if (state is SessionPageSelectedState) MaterialPage(child: LoadingScreen()),
                if (state is SessionIngredientCategoryState) MaterialPage(child: IngredientCategorieView()),
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
