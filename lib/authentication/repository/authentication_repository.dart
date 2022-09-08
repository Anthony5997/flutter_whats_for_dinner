import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final Future<SharedPreferences> _userPreferences = SharedPreferences.getInstance();

  Future<dynamic> login(username, password) async {
    final response = await _helper.postLogin(username, password);
    await setUserSharedPreferences(response);

    return response;
  }

  Future<dynamic> register(username, email, password) async {
    final response = await _helper.postRegister(username, email, password);
    await setUserSharedPreferences(response);
    return response;
  }

  Future<dynamic> attemptAutoLogin(Emitter emit) async {
    final SharedPreferences pref = await _userPreferences;
    // await getUserSharedPreferences(pref);
    if (pref.getBool("logged") == null) {
      emit(LoginState());
    } else {
      emit(AuthenticationSuccessState());
    }
  }

  Future<dynamic> logout(Emitter emit) async {
    final SharedPreferences pref = await _userPreferences;
    pref.clear();
    emit(LogoutState());
  }

  Future<dynamic> setUserSharedPreferences(payload) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("id", payload['user']['id']);
    await pref.setString("nickname", payload['user']['nickname']);
    await pref.setString("email", payload['user']['email']);
    await pref.setString("token", payload['token']);
    await pref.setBool("logged", true);
  }

  Future<dynamic> getUserSharedPreferences() async {
    SharedPreferences pref = await _userPreferences;
    return pref;
  }
}
