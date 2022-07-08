import 'package:flutter/foundation.dart';

class AuthenticationCredentials {
  final String username;
  final String? email;
  String? userId;

  AuthenticationCredentials({
    required this.username,
    this.email,
    this.userId,
  });
}
