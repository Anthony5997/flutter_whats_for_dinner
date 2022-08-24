import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/models/IngredientCategory.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_whats_for_dinner/services/app_exception.dart';
import 'package:http/http.dart' as http;

class IngredientCategoryRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

  Future<dynamic> get() async {
    final response = await _helper.getAuth("/ingredients/category");
    print(response);

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }

  Future<dynamic> getById(id) async {
    final response = await _helper.getAuth("/ingredients/category/$id");
    print("REPONSE INGREDIENT BY CAT");
    print(response['results']);

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
    print("REPONSE INGREDIENT BY CAT");
    print(response['results']);

    // List<IngredientCategory> listIngredient = [];

    // response["results"].forEach((result) {
    //   listIngredient.add(IngredientCategory.fromJson(result));
    // });
    // print(listIngredient);

    return response;
  }
}
