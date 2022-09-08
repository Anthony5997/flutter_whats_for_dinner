import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/Session/services/session_navigator.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/screen/login_view.dart';
import 'package:flutter_whats_for_dinner/authentication/screen/register_view.dart';
import 'package:flutter_whats_for_dinner/screen/loading_screen.dart';

class AuthenticationNavigator extends StatefulWidget {
  const AuthenticationNavigator({Key? key}) : super(key: key);

  @override
  State<AuthenticationNavigator> createState() => _AuthenticationNavigatorState();
}

class _AuthenticationNavigatorState extends State<AuthenticationNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AutoConnexionAttemptEvent()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          print("NAVIGATOR STATE");
          print(state);

          return Navigator(
            pages: [
              // Show login
              if (state is AutoConnexionAttemptState) const MaterialPage(child: LoadingScreen()),
              if (state is ConnexionLoadingState) const MaterialPage(child: LoadingScreen()),
              if (state is LoginState) MaterialPage(child: LoginView(formKey: GlobalKey<FormBuilderState>())),
              if (state is RegisterState) MaterialPage(child: RegisterView(formKey: GlobalKey<FormBuilderState>())),
              if (state is AuthenticationSuccessState) MaterialPage(child: SessionNavigator()),
              if (state is LogoutState)
                MaterialPage(
                    child: LoginView(
                  formKey: GlobalKey<FormBuilderState>(),
                )),
            ],
            onPopPage: (route, result) => route.didPop(result),
          );
        },
      ),
    );
  }
}
