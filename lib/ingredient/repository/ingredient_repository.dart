import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';

class IngredientRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> get() async {
    final response = await _helper.getAuth("/ingredients/");

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }
}
