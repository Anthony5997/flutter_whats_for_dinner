import 'dart:convert';
import 'dart:io';

import 'package:flutter_whats_for_dinner/services/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://laravel_whats_for_dinner.test/api";
  final Future<SharedPreferences> _userPreferences =
      SharedPreferences.getInstance();

  Future<dynamic> get(String url) async {
    var responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl + url));

      responseJson = _returnResponse(response);
    } on SocketException {
      throw Exception('Failed to load');
    }
    return responseJson;
  }

  Future<dynamic> getAuth(String url) async {
    var responseJson;
    final SharedPreferences prefs = await _userPreferences;
    var token = await prefs.get("token");

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

/* NE FONCTIONNE QUE POUR L'AJOUT AU FRIDGE POUR L INSTANT */
  Future<dynamic> postAuth(String url, array) async {
    var responseJson;

    final SharedPreferences prefs = await _userPreferences;
    var token = await prefs.get("token");
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

  Future<dynamic> getAuthParametre(String url) async {
    var responseJson;
    final SharedPreferences prefs = await _userPreferences;
    var token = await prefs.get("token");
    // var id = await prefs.get("id");

    try {
      print('$_baseUrl$url');
      print(token);

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

  Future<dynamic> postLogin(email, password) async {
    var responseJson;
    try {
      print("LOGIN METHOD");

      print(email);
      print(password);
      print("===================================");

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
    var responseJson;
    try {
      print("REGISTER METHOD");
      print(name);
      print(email);
      print(password);
      print("===================================");

      final response = await http.post(
        Uri.parse(_baseUrl + "/auth/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nickname': name,
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

  dynamic _returnResponse(http.Response response) {
    print("statusCode");
    print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
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
