import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/services/session_navigator.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/SimpleBlocObserver.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/services/authentication_navigator.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/ingredient_categorie_bloc.dart';
import 'package:flutter_whats_for_dinner/recipe_list/bloc/recipe_list_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
        BlocProvider<SessionBloc>(
          create: (BuildContext context) => SessionBloc(),
        ),
        BlocProvider<IngredientCategorieBloc>(
          create: (BuildContext context) => IngredientCategorieBloc(),
        ),
        BlocProvider<FridgeBloc>(
          create: (BuildContext context) => FridgeBloc(),
        ),
        BlocProvider<RecipeListBloc>(
          create: (BuildContext context) => RecipeListBloc(),
        ),
      ],
      child: MaterialApp(
        theme: LigthTheme.themedata,
        debugShowCheckedModeBanner: false,
        title: 'What\'s For Dinner',
        // theme: theme,
        initialRoute: '/',
        routes: {
          '/': ((context) => const AuthenticationNavigator()),
          '/session': ((context) => SessionNavigator()),
        },
      ),
    );
  }
}
