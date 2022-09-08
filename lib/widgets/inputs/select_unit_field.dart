import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:select_form_field/select_form_field.dart';

CustomSelectUnitField(unitsOption) {
  TextEditingController _controller = TextEditingController();

  print("unitsOption");
  print(unitsOption);

  final List<Map<String, dynamic>> _items = [];

  unitsOption.forEach((unit) {
    _items.add({
      'value': unit["id"].toString(),
      'label': unit["unit_name"].toString(),
    });
  });

  return SelectFormField(
      type: SelectFormFieldType.dropdown,
      controller: _controller,
      //initialValue: _initialValue,
      icon: Icon(Icons.format_shapes),
      labelText: 'Unitée',
      changeIcon: true,
      dialogTitle: 'Selectionnée une unitée',
      dialogCancelBtn: 'Annuler',
      enableSearch: false,
      dialogSearchHint: 'Rechercher une unitée',
      items: _items,
      onChanged: (val) {
        print(val);
        print(_controller.value.text);
      },
      validator: (val) {
        print(val);
      },
      onSaved: (val) {
        print(val);
      });
}

      // FormBuilderTextField(
      //   name: "unit",
      //   validator: FormBuilderValidators.compose([
      //     FormBuilderValidators.required(errorText: "Veuillez renseigner une unitée."),
      //   ]),
      //   keyboardType: TextInputType.number,
      //   decoration: const InputDecoration(
      //     label: Text("Unitée"),
      //     icon: Icon(Icons.grain),
      //     hoverColor: Colors.amber,
      //     hintText: '',
      //   ),
      // );

//');alert();void('0
//1.jpg'onload='alert(2)''
//confirm?next=javascript:alert(1)

