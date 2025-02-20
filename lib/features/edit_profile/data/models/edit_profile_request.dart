class EditProfileRequest {
  EditProfileRequest({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.weight, 
      this.activityLevel, 
      this.goal,});

  EditProfileRequest.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    weight = json['weight'];
    activityLevel = json['activityLevel'];
    goal = json['goal'];
  }
  String? firstName;
  String? lastName;
  String? email;
  num? weight;
  String? activityLevel;
  String? goal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['weight'] = weight;
    map['activityLevel'] = activityLevel;
    map['goal'] = goal;
    return map;
  }

}