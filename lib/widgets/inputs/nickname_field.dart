import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomNicknameField extends StatelessWidget {
  CustomNicknameField({this.value}) : super();
  String? value;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "nickname",
      initialValue: value,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: "Veuillez renseigner votre nom d'utilisateur."),
        FormBuilderValidators.maxLength(24, errorText: "Votre nom d'utilisateur ne doit pas contenir plus de 24 caractères."),
        FormBuilderValidators.minLength(4, errorText: "Votre nom d'utilisateur doit contenir au moins 4 caractères."),
      ]),
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(label: Text("Nom d'utilisateur"), icon: Icon(Icons.person)),
    );
  }
}
