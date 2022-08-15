import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_whats_for_dinner/services/app_exception.dart';
import 'package:http/http.dart' as http;

class FridgeRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final Future<SharedPreferences> _userPreferences =
      SharedPreferences.getInstance();

  Future<dynamic> getUserFridge(user) async {
    final response = await _helper.getAuth("/frigde");

    print(response);
  }
}
