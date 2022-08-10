import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/authentication_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _userPreferences =
        SharedPreferences.getInstance();

    print("USER PREF AFTER CO");
    print(_userPreferences);

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Session View'),
            TextButton(
                child: const Text('sign out'),
                onPressed: () =>
                    context.read<AuthenticationBloc>().add(LogoutEvent())),
          ],
        ),
      ),
    );
  }
}
