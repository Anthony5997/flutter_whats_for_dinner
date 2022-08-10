import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomEmailField extends StatelessWidget {
  CustomEmailField({this.value}) : super();
  String? value;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: "email",
      initialValue: value,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(
            errorText: "Veuillez renseigner votre email."),
        FormBuilderValidators.email(
            errorText: "Veuillez renseigner un email valide."),
      ]),
      keyboardType: TextInputType.emailAddress,
      decoration:
          const InputDecoration(label: Text("Email"), icon: Icon(Icons.email)),
    );
  }
}
