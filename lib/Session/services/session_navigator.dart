import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/confirmation/confirmation_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/register/register_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';
import 'package:flutter_whats_for_dinner/Session/session_view.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';

class SessionNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SessionBloc(
          context.read<AuthRepository>(),
          context.read<AuthenticationFlowBloc>(),
        ),
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            print("STATE SESSION NAVIGATOR");
            print(state);
            print("==============================");

            return Navigator(
              pages: [
                if (state is SessionInitial) MaterialPage(child: SessionView()),
                if (state is AuthenticationFlowShowLogoutState)
                  MaterialPage(child: LoginView()),
              ],
              onPopPage: (route, result) => route.didPop(result),
            );
          },
        ),
      ),
    );
  }
}
