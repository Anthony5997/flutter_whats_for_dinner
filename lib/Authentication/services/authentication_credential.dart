import 'package:flutter/foundation.dart';

class AuthenticationCredentials {
  final String username;
  final String? email;
  final String? password;
  String? userId;

  AuthenticationCredentials({
    required this.username,
    this.email,
    this.password,
    this.userId,
  });
}
