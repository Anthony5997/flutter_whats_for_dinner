import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/confirmation/confirmation_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/register/register_view.dart';
import 'package:flutter_whats_for_dinner/Session/services/session_navigator.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationFlowBloc, AuthenticationFlowState>(
        builder: (context, state) {
      print("state NAVIGATOR");
      print(state);
      return Navigator(
        pages: [
          // Show login
          // ignore: unrelated_type_equality_checks
          if (state is AuthenticationFlowShowLoginState)
            MaterialPage(child: LoginView()),

          // Allow push animation
          if (state == AuthenticationFlowShowRegisterState() ||
              state is AuthenticationFlowShowConfirmRegisterState) ...[
            // Show Sign up
            MaterialPage(child: RegisterView()),

            // Show confirm sign up
            if (state is AuthenticationFlowShowConfirmRegisterState)
              MaterialPage(child: ConfirmationView())
          ],
          if (state is AuthenticationFlowShowAuthenticationSuccessState)
            MaterialPage(child: SessionNavigator()),

          if (state is AuthenticationFlowShowLogoutState)
            MaterialPage(child: LoginView()),
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
