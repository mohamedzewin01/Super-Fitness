import 'package:hive_flutter/hive_flutter.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;

  UserModel({
    required this.userId,
    required this.name,
    required this.image,
  });
}
