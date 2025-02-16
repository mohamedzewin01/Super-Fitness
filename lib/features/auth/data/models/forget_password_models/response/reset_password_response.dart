
import '../../../../domain/entities/forget_password_entities/reset_password_entity.dart';

class ResetPasswordResponse {
  ResetPasswordResponse({
      this.message, 
      this.token,
      this.error
  });

  ResetPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
    error = json['error'];
  }
  String? message;
  String? token;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    map['error'] = error;
    return map;
  }
  ResetPasswordEntity toResetPasswordEntity() {
    return ResetPasswordEntity(message: message, token: token, error: error);
  }
}