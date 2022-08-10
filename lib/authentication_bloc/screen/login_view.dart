import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/email_field.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/password_field.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key, required this.formKey, this.error}) : super(key: key);

  String? error;
  GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormBuilder(
        key: formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomEmailField(),
                  const SizedBox(height: 30),
                  CustomPasswordField(),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          formKey.currentState!.save();
                          print("FORM INPUT LOGIN");
                          print(formKey.currentState?.value['email']);
                          print(formKey.currentState?.value['password']);
                          print("=========================");

                          context.read<AuthenticationBloc>().add(LoginEvent(
                              email: formKey.currentState?.value['email'],
                              password:
                                  formKey.currentState?.value['password']));
                        }
                      },
                      child: const Text('Se connecter'),
                    ),
                  ),
                  _showSignUpButton(context),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _showSignUpButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
          child: const Text('Vous possedez déjà un compte ? Connectez vous.'),
          onPressed: () {
            context.read<AuthenticationBloc>()..add(ShowRegisterEvent());
          }),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
