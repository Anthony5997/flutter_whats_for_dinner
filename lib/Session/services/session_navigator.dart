import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_view.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/screen/login_view.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';

class SessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SessionBloc(),
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            return Navigator(
              pages: [
                if (state is SessionInitial) MaterialPage(child: SessionView()),
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
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
