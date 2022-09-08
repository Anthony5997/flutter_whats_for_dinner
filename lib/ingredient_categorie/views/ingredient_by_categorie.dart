import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/quantity_field.dart';
import 'package:select_form_field/select_form_field.dart';

class IngredientByCategorieScreen extends StatelessWidget {
  IngredientByCategorieScreen({required this.ingredient});

  final ingredient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: const Text(
          "Ajouter un ingredient",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: ingredient.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text(ingredient[index]["id"].toString()),
              ),
              title: Text(ingredient[index]["name"]),
              subtitle: Text(ingredient[index]["name"]),
              trailing: AddIngredientButtonDialog(ingredient[index]["id"]),
            );
          },
        ),
      ),
    );
  }
}

class AddIngredientButtonDialog extends StatelessWidget {
  AddIngredientButtonDialog(this.ingredientId);
  int ingredientId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.add_circle,
        color: Colors.red,
        size: 35,
      ),
      tooltip: 'Ajouter au frigo',
      onPressed: () => _showMyDialog(context, ingredientId),
    );
  }
}

Future<void> _showMyDialog(context, ingredientId) async {
  IngredientCategoryRepository ingredientCategoryRepository = IngredientCategoryRepository();
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  var allUnits = await ingredientCategoryRepository.getAllUnits();

  TextEditingController _controller = TextEditingController();

  String _valueChanged = '';

  final List<Map<String, dynamic>> _items = [];

  allUnits.forEach((unit) {
    _items.add({
      'value': unit["id"].toString(),
      'label': unit["unit_name"].toString(),
    });
  });

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Row(
              children: [
                // addFridgeIngredientQuantity(allUnits: allUnits, formKey: formKey),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: CustomQuantityField(),
                ),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: SelectFormField(
                      type: SelectFormFieldType.dropdown,
                      controller: _controller,
                      //initialValue: _initialValue,
                      icon: const Icon(Icons.format_shapes),
                      labelText: 'Unitée',
                      changeIcon: true,
                      dialogTitle: 'Selectionnée une unitée',
                      dialogCancelBtn: 'Annuler',
                      enableSearch: false,
                      dialogSearchHint: 'Rechercher une unitée',
                      items: _items,
                      onChanged: (val) {
                        _valueChanged = val;
                      },
                      validator: (val) {},
                      onSaved: (val) {}),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Annuler'),
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () async {
              if (formKey.currentState?.validate() == true) {
                formKey.currentState!.save();

                context.read<FridgeBloc>().add(FridgeAddIngredientEvent(quantity: formKey.currentState?.value['quantity'], unit: _valueChanged, ingredientId: ingredientId));
                Navigator.pop(context, 'Ajouter');
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      );
    },
  );
}
