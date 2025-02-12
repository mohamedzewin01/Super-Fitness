import 'package:super_fitness/features/auth/domain/entities/forget_password_entities/forget_password_entity.dart';

/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordResponse {
  ForgetPasswordResponse({
      this.message, 
      this.info,
      this.error
  });

  ForgetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    info = json['info'];
    error = json['error'];
  }
  String? message;
  String? info;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['info'] = info;
    map['error'] = error;
    return map;
  }

  ForgetPasswordEntity toForgetPasswordEntity() {
    return ForgetPasswordEntity(message: message, info: info, error: error);
  }
}