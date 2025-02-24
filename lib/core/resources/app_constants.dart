import 'package:flutter/material.dart';

import '../../features/layout/presentation/pages/exercisers_view.dart';
import '../../features/layout/presentation/pages/gemini_ai_view.dart';
import '../../features/layout/presentation/pages/home_view.dart';
import '../../features/layout/presentation/pages/profile_view.dart';

class AppConstants {
  static const int listGenerate = 6;
  static const double blurConst12 = 12.5;
  static const double blurConst34 = 34.5;
  static const int blurConst50 = 50;
  static const int blurConst20 = 20;


  static const String defaultEmail = "default_email@example.com";
  static const String timerUnit = "sec";
  static const int millisecondsDelayed = 100;

  static const String loading = "Loading...";
  static const String chatHistoryBox = "chat_history";
  static const String userBox = "user_box";
  static const String settingsBox = "settings_box";
  static const String chatMessagesBox = "chat_messages_";
  static const String geminiDB = "gemini.db";

  static final List<int> ageList = List.generate(90, (index) => index);
  static final List<int> weightList = List.generate(300, (index) => index);
  static final List<int> heightList = List.generate(300, (index) => index);

  static const viewOptions = <Widget>[
    HomeView(),
    GeminiAiView(),
    ExercisersView(),
    ProfileView(),
  ];
}
