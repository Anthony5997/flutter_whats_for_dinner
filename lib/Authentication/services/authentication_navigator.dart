import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_cubit.dart';
import 'package:flutter_whats_for_dinner/Authentication/confirmation/confirmation_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_view.dart';
import 'package:flutter_whats_for_dinner/Authentication/register/register_view.dart';

class AuthNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationFlowCubit, AuthenticationFlowState>(
        builder: (context, state) {
      print("state NAVIGATOR");
      print(state);
      return Navigator(
        pages: [
          // Show login
          // ignore: unrelated_type_equality_checks
          if (state is AuthenticationFlowLogin)
            MaterialPage(child: LoginView()),

          // Allow push animation
          if (state == AuthenticationFlowRegister() ||
              state == AuthenticationFlowConfirmRegister()) ...[
            // Show Sign up
            MaterialPage(child: RegisterView()),

            // Show confirm sign up
            if (state == AuthenticationFlowConfirmRegister())
              MaterialPage(child: ConfirmationView())
          ]
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
