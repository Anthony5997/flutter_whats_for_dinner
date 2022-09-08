import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/quantity_field.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/select_unit_field.dart';

class addFridgeIngredientQuantity extends StatelessWidget {
  addFridgeIngredientQuantity({Key? key, this.error, required this.allUnits, required GlobalKey<FormBuilderState> this.formKey}) : super(key: key);
  List allUnits;
  GlobalKey<FormBuilderState> formKey;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: FormBuilder(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Row(
            children: [
              SizedBox(
                width: 300,
                height: 100,
                child: CustomQuantityField(),
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: CustomSelectUnitField(allUnits),
              )
            ],
          ),
        ),
      ),
    );
  }
}
