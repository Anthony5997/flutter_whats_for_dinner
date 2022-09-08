import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

FormBuilderTextField CustomQuantityField() {
  return FormBuilderTextField(
    name: "quantity",
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(errorText: "Veuillez renseigner une quantitée."),
      FormBuilderValidators.integer(errorText: "Veuillez renseigner une quantitée valide."),
    ]),
    keyboardType: TextInputType.number,
    decoration: const InputDecoration(
      label: Text("Quantitée"),
      icon: Icon(Icons.kitchen),
      hoverColor: Colors.amber,
      hintText: '',
    ),
  );
}
