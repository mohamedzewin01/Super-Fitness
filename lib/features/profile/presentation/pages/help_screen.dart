import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

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
        appBar: AppBar(
          title: Text(
            "Help & Support",
            style: GoogleFonts.balooThambi2(color: Colors.white),
          ),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How can we help you?",
                style: GoogleFonts.balooThambi2(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    HelpItem(
                      icon: Icons.question_answer,
                      title: "Frequently Asked Questions",
                      subtitle: "Find answers to common questions.",
                    ),
                    HelpItem(
                      icon: Icons.lock,
                      title: "Privacy & Security",
                      subtitle: "Learn how we protect your data.",
                    ),
                    HelpItem(
                      icon: Icons.support_agent,
                      title: "Contact Support",
                      subtitle: "Get in touch with our team.",
                    ),
                    HelpItem(
                      icon: Icons.settings,
                      title: "App Settings",
                      subtitle: "Customize your app experience.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const HelpItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(
          title,
          style: GoogleFonts.balooThambi2(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.balooThambi2(fontSize: 14, color: Colors.grey),
        ),
        onTap: () {},
      ),
    );
  }
}
