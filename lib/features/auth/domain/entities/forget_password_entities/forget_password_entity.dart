/// message : "success"
/// info : "OTP sent to your email"

class ForgetPasswordEntity {
  ForgetPasswordEntity({
      this.message, 
      this.info,
      this.error
  });

  String? message;
  String? info;
  String? error;


}