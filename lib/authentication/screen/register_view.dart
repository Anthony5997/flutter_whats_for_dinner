import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/email_field.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/nickname_field.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/password_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key, required this.formKey, this.error}) : super(key: key);

  String? error;
  GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text(
          'Inscription',
          style: TextStyle(fontSize: 24, fontFamily: 'FruitPunch'),
        ),
      ),
      body: FormBuilder(
        key: formKey,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/Logo-genial.png',
                height: 190,
              ),
              const Text(
                "What's For Dinner",
                style: TextStyle(fontFamily: 'FruitPunch', fontSize: 30),
              ),
              const SizedBox(height: 30),
              CustomNicknameField(),
              const SizedBox(height: 20),
              CustomEmailField(),
              const SizedBox(height: 20),
              CustomPasswordField(),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      formKey.currentState!.save();
                      print("FORM INPUT REGISTER");
                      print(formKey.currentState?.value['nickname']);
                      print(formKey.currentState?.value['email']);
                      print(formKey.currentState?.value['password']);
                      print("=========================");

                      context.read<AuthenticationBloc>().add(RegisterEvent(
                          nickname: formKey.currentState?.value['nickname'],
                          email: formKey.currentState?.value['email'],
                          password: formKey.currentState?.value['password']));
                    }
                  },
                  child: Text('S\'inscrire'),
                ),
              ),
              _showLoginButton(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _showLoginButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
          child: const Text(
              'Vous n\'avez pas encore de compte ? Inscrivez vous !'),
          onPressed: () {
            context.read<AuthenticationBloc>().add(ShowLoginEvent());
          }),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
