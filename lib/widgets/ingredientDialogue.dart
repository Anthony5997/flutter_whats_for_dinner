import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/ingredient_categorie/repository/ingredient_categorie_repository.dart';
import 'package:flutter_whats_for_dinner/widgets/inputs/quantity_field.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/customSnackbar.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/themes/theme.dart';
import 'package:select_form_field/select_form_field.dart';

class AddIngredientButtonDialog extends StatelessWidget {
  AddIngredientButtonDialog(this.ingredient);
  var ingredient;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.add_circle,
        color: primaryColor,
        size: 35,
      ),
      tooltip: 'Ajouter au frigo',
      onPressed: () => _showMyDialog(context, ingredient),
    );
  }
}

Future<void> _showMyDialog(context, ingredient) async {
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
      double height = MediaQuery.of(context).size.height;
      double width = MediaQuery.of(context).size.width;
      return AlertDialog(
        title: const Text('Ajouter'),
        content: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                Image.network(Uri.encodeFull('http://laravel_whats_for_dinner.test/${ingredient['image']}')),
                CustomQuantityField(),
                SelectFormField(
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

                context.read<FridgeBloc>().add(FridgeAddIngredientEvent(quantity: formKey.currentState?.value['quantity'], unit: _valueChanged, ingredientId: ingredient['id']));
                Navigator.pop(context, 'Ajouter');
                ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "${ingredient['name']} ajouté", Colors.green));
              }
            },
            child: const Text('Ajouter'),
          ),
        ],
      );
    },
  );
}
