import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/email_field.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/password_field.dart';
import 'package:flutter_whats_for_dinner/widgets/messageErreur.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key, required this.formKey, this.error}) : super(key: key);

  String? error;
  GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(
          'Connexion',
          style: TextStyle(fontSize: 24, fontFamily: mainFontFamily),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: FormBuilder(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                Image.asset(
                  'assets/images/logo-genial.png',
                  height: 190,
                ),
                Text(
                  "What's For Dinner",
                  style: TextStyle(fontFamily: mainFontFamily, fontSize: 30),
                ),
                const SizedBox(height: 30),
                if (error != null) MessageErreur(messageErreur: error ?? ''),
                const SizedBox(height: 30),
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
                        context.read<AuthenticationBloc>().add(LoginEvent(email: formKey.currentState?.value['email'], password: formKey.currentState?.value['password']));
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
      ),
    );
  }

  Widget _showSignUpButton(BuildContext context) {
    return SafeArea(
      child: TextButton(
          child: const Text('Vous n\'avez pas encore de compte ? Inscrivez vous !', textAlign: TextAlign.center),
          onPressed: () {
            context.read<AuthenticationBloc>().add(ShowRegisterEvent());
          }),
    );
  }
}
