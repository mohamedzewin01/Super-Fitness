

class ForgetPasswordRequest {
  ForgetPasswordRequest({
      this.email,});

  ForgetPasswordRequest.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }



}