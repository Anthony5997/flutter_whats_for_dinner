import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';
import 'package:flutter_whats_for_dinner/widgets/customDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

    print("USER PREF AFTER CO");
    print(_userPreferences);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon frigo'),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Session View'),
              // const Text(_userPreferences.getString("nickname")),
              TextButton(child: const Text('sign out'), onPressed: () => context.read<AuthenticationBloc>().add(LogoutEvent())),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
