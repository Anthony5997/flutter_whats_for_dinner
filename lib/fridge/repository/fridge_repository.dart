import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/models/Fridge.dart';
import 'package:flutter_whats_for_dinner/models/Ingredient.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_whats_for_dinner/services/app_exception.dart';
import 'package:http/http.dart' as http;

class FridgeRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

  Future<dynamic> getUserFridge() async {
    final response = await _helper.getAuthParametre("/fridge");

    print("response");
    print(response);
    // List<Ingredient> test = [];
    // response["results"].forEach((result) => {test.add(Ingredient.fromJson(result))});
    // print("test");
    // print(test);
    // Fridge listFridge = Fridge(id: response.results[0].id, user: response.results[0].user_id, ingredients_list: test);
    // print("listFridge");
    // print(listFridge);
    return response;
  }
}
