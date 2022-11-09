import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FridgeRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Fridge> getUserFridge() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    final response = await _helper.getAuthParametre("/fridge");

    List<Ingredient> ingredients = [];
    if (response["results"].length > 0) {
      response["results"]["ingredients"].forEach((result) {
        ingredients.add(Ingredient.fromJson(result));
      });

      Fridge listFridge = Fridge(id: response["results"]["id"], ingredients_list: ingredients);
      return listFridge;
    } else {
      String fridgeId = "";

      if (pref.getString('fridge_id') != null) {
        fridgeId = pref.getString('fridge_id')!;
      }

      Fridge listFridge = Fridge(id: fridgeId, ingredients_list: ingredients);
      return listFridge;
    }
  }

  Future<dynamic> addIngredientFridge(array) async {
    var response = {"response": await _helper.postAuthAddIngredientInFridge("/fridge/addIngredient", array[0]), "fridge": await getUserFridge()};

    return response;
  }

  Future<dynamic> updateIngredientFridge(array) async {
    var response = {"response": await _helper.postAuthUpdateIngredientInFridge("/fridge/updateIngredient", array[0]), "fridge": await getUserFridge()};

    return response;
  }

  Future<Fridge> deleteIngredientFridge(array) async {
    await _helper.postAuthDeleteIngredientInFridge("/fridge/deleteIngredient", array[0]);
    Fridge fridge = await getUserFridge();

    return fridge;
  }

  Future<Fridge> deleteAllIngredientsFridge(fridgeId) async {
    await _helper.postAuthDeleteAllIngredientsInFridge("/fridge/deleteAllIngredients", fridgeId);
    Fridge fridge = await getUserFridge();

    return fridge;
  }
}
