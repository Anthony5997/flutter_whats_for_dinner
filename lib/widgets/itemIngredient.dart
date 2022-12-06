import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_whats_for_dinner/fridge/fridge_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/widgets/ui/customSnackbar.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:swipe_to/swipe_to.dart';

class ItemIngredient extends StatefulWidget {
  ItemIngredient(List<Ingredient> this.ingredients_list, int this.index, this.units) : super();

  List<Ingredient> ingredients_list;
  int index;
  List<dynamic> units;

  @override
  State<ItemIngredient> createState() => _ItemIngredientState();
}

class _ItemIngredientState extends State<ItemIngredient> {
  @override
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  TextEditingController _controller = TextEditingController();

  String _valueChanged = '';

  // Initially password is obscure
  bool _visibility = false;
  bool _visibilityCard = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _visibility = !_visibility;
    });
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    @override
    List<Map<String, dynamic>> _items = [];
    widget.units.forEach((unit) {
      _items.add({
        'value': unit["id"].toString(),
        'label': unit["unit_name"].toString(),
      });
    });
    return Visibility(
      visible: _visibilityCard,
      child: SwipeTo(
        onRightSwipe: () {
          setState(() {
            _visibilityCard = false;
          });
          BlocProvider.of<FridgeBloc>(context).add(FridgeDeleteIngredientEvent(ingredientId: widget.ingredients_list[widget.index].id));

          // Then show a snackbar.
          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "${widget.ingredients_list[widget.index].name} supprimer", Colors.green));
        },
        child: Card(
          color: Colors.grey[300],
          elevation: 8,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Color.fromARGB(255, 125, 29, 23),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
                  leading: Container(
                    padding: const EdgeInsets.only(right: 12.0),
                    decoration: BoxDecoration(border: new Border(right: BorderSide(width: 1.0, color: Colors.white24))),
                    child: Image.network(Uri.encodeFull('http://laravel_whats_for_dinner.test/${widget.ingredients_list[widget.index].image}')),
                  ),
                  title: Text(
                    widget.ingredients_list[widget.index].name,
                    style: TextStyle(color: Colors.red[900], fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      // Icon(
                      //   Icons.public_rounded,
                      //   color: Colors.red[900],
                      // ),
                      Text(
                        widget.ingredients_list[widget.index].quantity.toString() + " " + widget.ingredients_list[widget.index].unit_name.toString(),
                        style: TextStyle(
                          color: Colors.red[900],
                        ),
                      )
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.pending,
                            color: Colors.red,
                            size: 26,
                          ),
                          tooltip: 'Modifier',
                          onPressed: () {
                            _toggle();
                          }),
                      IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                          size: 26,
                        ),
                        tooltip: 'Supprimer du frigo',
                        onPressed: () {
                          setState(() {
                            _visibilityCard = false;
                          });
                          BlocProvider.of<FridgeBloc>(context).add(FridgeDeleteIngredientEvent(ingredientId: widget.ingredients_list[widget.index].id));
                          ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "${widget.ingredients_list[widget.index].name} supprimer", Colors.green));
                        },
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _visibility,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FormBuilder(
                          key: formKey,
                          child: Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                                  width: width * 0.25,
                                  child: FormBuilderTextField(
                                    initialValue: widget.ingredients_list[widget.index].quantity.toString(),
                                    name: "quantity",
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(errorText: "Champ vide."),
                                      FormBuilderValidators.integer(errorText: "Champ invalide."),
                                    ]),
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      label: Text("Quantitée"),
                                      hoverColor: Colors.amber,
                                      hintText: '',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
                                  width: width * 0.25,
                                  child: SelectFormField(
                                      type: SelectFormFieldType.dropdown,
                                      controller: _controller,
                                      //initialValue: _initialValue,
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
                        Row(
                          children: [
                            TextButton(
                              child: Icon(Icons.cancel_outlined),
                              onPressed: () => {
                                setState(() {
                                  _visibility = false;
                                })
                              },
                            ),
                            TextButton(
                              child: Icon(Icons.check),
                              onPressed: () async {
                                if (formKey.currentState?.validate() == true) {
                                  formKey.currentState!.save();
                                  context.read<FridgeBloc>().add(FridgeModifyIngredientEvent(quantity: formKey.currentState?.value['quantity'], unit: _valueChanged, ingredientId: widget.ingredients_list[widget.index].id));
                                  setState(() {
                                    widget.ingredients_list[widget.index].quantity = int.parse(formKey.currentState?.value['quantity']);
                                    _visibility = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(CustomSnackBar(context, "Quantitée modifié", Colors.green));
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
