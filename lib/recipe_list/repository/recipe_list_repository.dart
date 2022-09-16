import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';

class RecipeListRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> get() async {
    final response = await _helper.getAuth("/recipe/potentialRecipes");

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);
    print("response RECIPE");
    print(response);
    return response;
  }
}
