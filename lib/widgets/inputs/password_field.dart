import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomPasswordField extends StatelessWidget {
  CustomPasswordField({this.value}) : super();
  String? value;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "password",
      initialValue: value,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: "Veuillez saisir un mot de passe."),
        FormBuilderValidators.maxLength(24,
            errorText:
                "Votre mot de passe ne doit pas contenir plus de 24 caractères."),
        FormBuilderValidators.minLength(8,
            errorText:
                "Votre mot de passe doit contenir au moins 8 caractères."),
      ]),
      keyboardType: TextInputType.visiblePassword,
      decoration: const InputDecoration(
          label: Text("Mot de passe"), icon: Icon(Icons.security)),
    );
  }
}
