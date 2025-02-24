import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Text("Home Page",style: TextStyle(fontSize: 40,color: Colors.white),),
      ),


    );
  }
}
