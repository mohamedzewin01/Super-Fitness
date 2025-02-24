import 'package:flutter/material.dart';

class GeminiAiView extends StatelessWidget {
  const GeminiAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Text("Chat With Gemini",style: TextStyle(fontSize: 40,color: Colors.white),),
      ),


    );
  }
}
