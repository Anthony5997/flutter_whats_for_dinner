import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_whats_for_dinner/authentication/authentication_bloc.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();
  final Future<SharedPreferences> _userPreferences =
      SharedPreferences.getInstance();

  Future<dynamic> login(username, password) async {
    print('attempting login');
    final response = await _helper.postLogin(username, password);
    print("response in login function");
    print(response);
    await setUserSharedPreferences(response);

    return response;
  }

  Future<dynamic> register(username, email, password) async {
    print('attempting register');
    final response = await _helper.postRegister(username, email, password);
    print("response in register function");
    print(response);
    await setUserSharedPreferences(response);
    return response;
  }

  Future<dynamic> attemptAutoLogin(Emitter emit) async {
    final SharedPreferences pref = await _userPreferences;
    print("JE TENTE DE ME CO");
    print(pref.getBool("logged"));
    // await getUserSharedPreferences(pref);
    if (await pref.getBool("logged") == null) {
      print("AUTO CONNEXION ECHOUE");
      emit(LoginState());
    } else {
      print("AUTO CONNEXION REUSSIS");

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

  Future<dynamic> getUserSharedPreferences(pref) async {
    // final SharedPreferences pref = await _userPreferences;
    String id = await pref.getString("id")!;
    String nickname = await pref.getString("nickname")!;
    String email = await pref.getString("email")!;
    String token = await pref.getString("token")!;

    print("USER INFO GET BY THE SHARED PREFERENCES");
    print(id);
    print(nickname);
    print(email);
    print(token);
    print("====================================");
  }
}
