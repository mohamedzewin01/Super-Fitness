import '../../../domain/entities/logout_entitty.dart';

class LogoutResponse {
  LogoutResponse({
      this.message,});

  LogoutResponse.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
  LogoutEntity toLogoutEntity() {
    return LogoutEntity(message: message);
  }

}