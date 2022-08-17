import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFFfffdf7),
          color: Color(0xFFCA2525),
        ),
      ),
    );
  }
}
