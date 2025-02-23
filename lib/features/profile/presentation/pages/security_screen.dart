import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/profile_photo.png")),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter PIN to Access Super Fitness",
              style: GoogleFonts.balooThambi2(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey, // Change to green when PIN is entered
                  ),
                );
              }),
            ),
            SizedBox(height: 30),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2,
              padding: EdgeInsets.symmetric(horizontal: 50),
              children: List.generate(9, (index) {
                return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[800],
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                  ),
                  child: Text(
                    "${index + 1}",
                    style: GoogleFonts.balooThambi2(fontSize: 11, color: Colors.white),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.fingerprint, size: 50, color: Colors.green),
              onPressed: () {},
            ),
            Text(
              "Use Fingerprint",
              style: GoogleFonts.balooThambi2(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
