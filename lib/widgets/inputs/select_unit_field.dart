import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

CustomSelectUnitField(unitsOption) {
  TextEditingController _controller = TextEditingController();

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
      icon: const Icon(Icons.format_shapes),
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
