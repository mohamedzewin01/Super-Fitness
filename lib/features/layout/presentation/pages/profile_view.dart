import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Text("Profile",style: TextStyle(fontSize: 40,color: Colors.white),),
      ),


    );
  }
}
