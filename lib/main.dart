import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/SimpleBlocObserver.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/repository/authentication_repository.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/services/authentication_navigator.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'What\'s For Dinner',
        // theme: theme,
        initialRoute: '/',
        routes: {
          '/': ((context) => const AuthenticationNavigator()),
        },
      ),
    );
  }
}
