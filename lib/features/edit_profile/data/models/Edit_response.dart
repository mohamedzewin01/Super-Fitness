import '../../domain/entities/edit_profile_entity.dart';

class EditProfileResponse {
  EditProfileResponse({
      this.message, 
      this.user,});

  EditProfileResponse.fromJson(dynamic json) {
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
  EditProfileEntity toEditProfileEntities() {
    return  EditProfileEntity(message: message);
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
      this.passwordResetCode, 
      this.passwordResetExpires, 
      this.resetCodeVerified,});

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
    passwordResetCode = json['passwordResetCode'];
    passwordResetExpires = json['passwordResetExpires'];
    resetCodeVerified = json['resetCodeVerified'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  num? age;
  num? weight;
  num? height;
  String? activityLevel;
  String? goal;
  String? photo;
  String? createdAt;
  String? passwordResetCode;
  String? passwordResetExpires;
  bool? resetCodeVerified;

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
    map['passwordResetCode'] = passwordResetCode;
    map['passwordResetExpires'] = passwordResetExpires;
    map['resetCodeVerified'] = resetCodeVerified;
    return map;
  }

}