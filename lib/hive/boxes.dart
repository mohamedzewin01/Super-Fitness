import 'package:hive/hive.dart';
import 'package:super_fitness/core/resources/app_constants.dart';
import 'package:super_fitness/hive/chat_history.dart';
import 'package:super_fitness/hive/settings.dart';
import 'package:super_fitness/hive/user_model.dart';

class Boxes {
  // get the caht history box
  static Box<ChatHistory> getChatHistory() =>
      Hive.box<ChatHistory>(AppConstants.chatHistoryBox);

  // get user box
  static Box<UserModel> getUser() => Hive.box<UserModel>(AppConstants.userBox);

  // get settings box
  static Box<Settings> getSettings() =>
      Hive.box<Settings>(AppConstants.settingsBox);
}
