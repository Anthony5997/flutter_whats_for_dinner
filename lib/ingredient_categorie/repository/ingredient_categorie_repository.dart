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

  Future<dynamic> getById(id) async {
    final response = await _helper.getAuth("/ingredients/category/$id");
    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }

  Future<dynamic> addIngredientIntoFridge(userId, ingredientId) async {
    final response = await _helper.postAuth("/fridge/addIngredient/", [
      {
        "userId": userId,
        "ingredientId": ingredientId,
      }
    ]);

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }

  Future<List<dynamic>> getAllUnits() async {
    var response = await _helper.get("/units");

    return response['results'];
  }
}
