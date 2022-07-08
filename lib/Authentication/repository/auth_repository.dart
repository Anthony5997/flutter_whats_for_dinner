import 'package:flutter_whats_for_dinner/Authentication/authentication_flow/authentication_flow_bloc.dart';
import 'package:flutter_whats_for_dinner/services/api_base_helper.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  // Future<void> login() async {
  //   print('attempting login');
  //   await Future.delayed(Duration(seconds: 3));
  //   print('logged in');
  //   // throw Exception('failed log in');
  // }

  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> login(username, password) async {
    print('attempting login');
    final response = await _helper.postLogin(username, password);
    print("response in login function");
    print(response);

    return response;
  }

  Future<dynamic> register(username, email, password) async {
    print('attempting register');
    final response = await _helper.postRegister(username, email, password);
    print("response in register function");
    print(response);
    return response;
  }

  Future<String> confirmRegister(
    String username,
    String confirmationCode,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    return 'abc';
  }

  Future<String> attemptAutoLogin() async {
    print("AUTO LOGIN PROCESS");
    throw Exception('not signed in');
  }

  // Future<void> signOut() async {
  //   // await Future.delayed(Duration(seconds: 2));
  //   print("deco");
  //   authFlow.add(AuthenticationFlowShowLogoutEvent());
  //   authFlow.emit(AuthenticationFlowShowLogoutState());
  // }
}
