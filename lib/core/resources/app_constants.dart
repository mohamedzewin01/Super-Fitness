import 'package:flutter/material.dart';
import 'package:super_fitness/features/gemini/presentation/views/welcome_page_chat_gemini.dart';
import 'package:super_fitness/features/layout/presentation/pages/home_view.dart';
import 'package:super_fitness/features/profile/presentation/pages/profile_tab.dart';

import '../../features/layout/presentation/pages/exercisers_view.dart';

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
  static const String imageNetwork =
      "https://thumbs.dreamstime.com/b/letter-w-vm-logo-icon-design-template-element-like-lightning-vector-illustration-128839214.jpg";
  static const String chatHistoryBox = "chat_history";
  static const String userBox = "user_box";
  static const String settingsBox = "settings_box";
  static const String chatMessagesBox = "chat_messages_";
  static const String geminiDB = "gemini.db";

  static final List<int> ageList = List.generate(90, (index) => index);
  static final List<int> weightList = List.generate(300, (index) => index);
  static final List<int> heightList = List.generate(300, (index) => index);
  static const List<String> goal = [
    'Gain Weight',
    'Lose Weight',
    'Get Fitter',
    'Gain More Flexible',
    'Learn The Basic'
  ];
  static const List<String> activityLevel = [
    'Rookie',
    'Beginner',
    'Intermediate',
    'Advance',
    'True Beast'
  ];
  static const List<String> activityLevelBackend = [
    'level1',
    'level2',
    'level3',
    'level4',
    'level5'
  ];
  static const String defaultPhoto =
      'https://fitness.elevateegy.com/uploads/default-profile.png';

  static const viewOptions = <Widget>[
    HomeView(),
    WelcomePageChatGemini(),
    ExercisersView(),
    ProfileTab(),
  ];
}
