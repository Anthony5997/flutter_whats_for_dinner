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

  Future<void> login(username, password) async {
    print('attempting login');
    final response = await _helper.postLogin(username, password);
    print("response in login function");
    print(response);

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return Album.fromJson(jsonDecode(response.body));
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
  }

  Future<void> register(username, email, password) async {
    print('attempting register');
    final response = await _helper.postRegister(username, email, password);
    print("response in register function");
    print(response);

    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   return Album.fromJson(jsonDecode(response.body));
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.
    //   throw Exception('Failed to load album');
    // }
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
    await Future.delayed(Duration(seconds: 1));
    throw Exception('not signed in');
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
