import 'package:super_fitness/features/profile/domain/entities/profile_response_entity.dart';

class ProfileResponseDto {
  ProfileResponseDto({
    this.message,
    this.user,
  });

  ProfileResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

  ProfileResponseEntity toProfileResponseEntity (){
    return ProfileResponseEntity(
      message: message,
      user: user?.toUserEntity(),
    );
  }
}

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.age,
    this.weight,
    this.height,
    this.activityLevel,
    this.goal,
    this.photo,
    this.createdAt,
  });

  User.fromJson(dynamic json) {
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    gender = json['gender'];
    age = json['age'];
    weight = json['weight'];
    height = json['height'];
    activityLevel = json['activityLevel'];
    goal = json['goal'];
    photo = json['photo'];
    createdAt = json['createdAt'];
  }

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  int? age;
  int? weight;
  int? height;
  String? activityLevel;
  String? goal;
  String? photo;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['gender'] = gender;
    map['age'] = age;
    map['weight'] = weight;
    map['height'] = height;
    map['activityLevel'] = activityLevel;
    map['goal'] = goal;
    map['photo'] = photo;
    map['createdAt'] = createdAt;
    return map;
  }

  UserEntity toUserEntity() {
    return UserEntity(
        weight: weight,
        goal: goal,
        age: age,
        activityLevel: activityLevel,
        createdAt: createdAt,
        photo: photo,
        lastName: lastName,
        firstName: firstName,
        email: email,
        gender: gender,
        id: id,
        height: height);
  }
}
