

import 'package:super_fitness/features/auth/domain/entities/forget_password_entities/verify_otp_entity.dart';

class VerifyOtpResponse {
  VerifyOtpResponse({
      this.status,
    this.error
  });

  VerifyOtpResponse.fromJson(dynamic json) {
    status = json['status'];
    error=json['error'];
  }
  String? status;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    return map;
  }

  VerifyOtpEntity toVerifyOtpEntity() {
    return VerifyOtpEntity(status: status, error: error);
  }
}