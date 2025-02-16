
class ResetPasswordEntity {
  ResetPasswordEntity({
      this.message, 
      this.token,
      this.error
  });

  String? message;
  String? token;
  String? error;


}