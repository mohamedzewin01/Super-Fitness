import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences sharedPreferences;

  static cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData(
      {required String key, required dynamic value}) async {
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static void deleteItem({required String key}) async {
    await sharedPreferences.remove(key);
  }

  static void clearItems() async {
    await sharedPreferences.clear();
  }
}

class CacheConstants {
  static const String defaultLanguage = 'defaultLanguage';
  static const String userToken = 'userToken';
  static const String userFirstName = 'userFirstName';
  static const String userLastName = 'userLastName';
  static const String userEmail = 'userEmail';
  static const String userPhone = 'userPhone';
  static const String age = 'age';
  static const String weight = 'weight';
  static const String height = 'height';
  static const String activityLevel = 'activityLevel';
  static const String goal = 'goal';
  static const String userImage = 'userImage';



}
