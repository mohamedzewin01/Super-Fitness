import '../../../domain/entities/login_entity.dart';

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.user,
    this.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

  LoginResponseEntity toLoginResponseEntity() {
    return LoginResponseEntity(
        user: user?.toUserEntity(), token: token, message: message);
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
        height: height,
        id: id,
        gender: gender,
        email: email,
        firstName: firstName,
        lastName: lastName,
        photo: photo,
        createdAt: createdAt,
        activityLevel: activityLevel,
        age: age,
        goal: goal,
        weight: weight);
  }
}
