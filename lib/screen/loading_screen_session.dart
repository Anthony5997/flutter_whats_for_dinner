import 'package:flutter/material.dart';
import 'package:flutter_whats_for_dinner/widgets/customBottomNavigationBar.dart';

class LoadingScreenSession extends StatelessWidget {
  const LoadingScreenSession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(
          backgroundColor: Color(0xFFfffdf7),
          color: Color(0xFFCA2525),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
