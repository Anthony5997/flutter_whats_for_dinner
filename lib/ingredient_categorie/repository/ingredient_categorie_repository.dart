import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';

class IngredientCategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> get() async {
    final response = await _helper.getAuth("/ingredients/category");

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }

  Future<List<Ingredient>> getById(id) async {
    final response = await _helper.getAuth("/ingredients/category/$id");
    List<Ingredient> listIngredient = [];

    response["results"].forEach((result) {
      listIngredient.add(Ingredient.fromJson(result));
    });
    return listIngredient;
  }

  Future<dynamic> addIngredientIntoFridge(userId, ingredientId) async {
    final response = await _helper.postAuth("/fridge/addIngredient/", [
      {
        "userId": userId,
        "ingredientId": ingredientId,
      }
    ]);
    return response;
  }

  Future<List<dynamic>> getAllUnits() async {
    var response = await _helper.get("/units");

    return response['results'];
  }
}
