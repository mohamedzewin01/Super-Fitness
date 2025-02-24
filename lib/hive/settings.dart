import 'package:hive_flutter/hive_flutter.dart';
part 'settings.g.dart';

@HiveType(typeId: 2)
class Settings extends HiveObject {
  @HiveField(0)
  bool isDark = false;
  @HiveField(1)
  bool shouldSpeak = true;
  Settings({
    required this.isDark,
    required this.shouldSpeak,
  });
}
