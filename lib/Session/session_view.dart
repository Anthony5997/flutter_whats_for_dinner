import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/login/login_bloc.dart';
import 'package:flutter_whats_for_dinner/Authentication/repository/auth_repository.dart';
import 'package:flutter_whats_for_dinner/Session/session_bloc.dart';

class SessionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authRepo: context.read<AuthRepository>(),
          authBloc: context.read<AuthenticationFlowBloc>(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Session View'),
            TextButton(
              child: const Text('sign out'),
              onPressed: () => context
                  .read<AuthenticationFlowBloc>()
                  .emit(AuthenticationFlowShowLogoutState()),
            ),
          ],
        ),
      ),
    );
  }
}
