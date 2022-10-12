import 'dart:convert';
import 'dart:io';

import 'package:flutter_whats_for_dinner/services/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  // final String _baseUrl = "http://laravel_whats_for_dinner.test/api";
  final String _baseUrl = "http://laravel_whats_for_dinner.test/api";
  final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

  Future<dynamic> get(String url) async {
    dynamic responseJson;
    print('$_baseUrl$url');

    try {
      final response = await http.get(Uri.parse(_baseUrl + url));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> getAuth(String url) async {
    dynamic responseJson;
    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    print("TOKEN");
    print(token);
    print("==================================");

    try {
      print('$_baseUrl$url');
      final response = await http.get(Uri.parse(_baseUrl + url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        'Access-Control_Allow_Origin': '*',
      });

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuth(String url, array) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Access-Control_Allow_Origin': '*',
        },
        body: jsonEncode(<String, String>{
          'idUser': array['idUser'],
          'ingredient_id': array['ingredient_id'],
        }),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthAddIngredientInFridge(String url, array) async {
    dynamic responseJson;
    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'fridgeId': array['fridgeId'].toString(),
          'ingredientId': array['ingredientId'].toString(),
          'quantity': array['quantity'].toString(),
          'unit': array['unit'].toString(),
        }),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthDeleteIngredientInFridge(String url, array) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'fridgeId': array['fridgeId'].toString(),
            'ingredientId': array['ingredientId'].toString(),
          },
        ),
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthDeleteAllIngredientsInFridge(String url, fridgeId) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'fridgeId': fridgeId,
          },
        ),
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthRecipeSearch(String url, saisis) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      print("route");
      print(_baseUrl + url);
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'input': saisis,
          },
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthRecipeDetail(String url, id) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      print("route");
      print(_baseUrl + url);
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'recipeId': id,
          },
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postAuthFavoriteToggle(String url, id) async {
    dynamic responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");
    try {
      print("route");
      print(_baseUrl + url);
      var response = await http.post(
        Uri.parse(_baseUrl + url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(
          <String, String>{
            'recipeId': id,
          },
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> getAuthParametre(String url) async {
    dynamic responseJson;
    final SharedPreferences prefs = await _userPreferences;
    var token = prefs.get("token");

    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'Access-Control_Allow_Origin': '*',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postLogin(email, password) async {
    dynamic responseJson;
    print(_baseUrl);
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + "/auth/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> postRegister(name, email, password) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(_baseUrl + "/auth/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'nickname': name,
            'email': email,
            'password': password,
          },
        ),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    print("statusCode");
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        // print("responseJson");
        // print(responseJson);

        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(response.body.toString());
    }
  }
}
