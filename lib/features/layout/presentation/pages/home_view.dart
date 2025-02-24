import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Text(
        "Home Page",
        style: TextStyle(
          fontSize: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
