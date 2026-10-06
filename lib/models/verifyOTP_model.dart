class verifyOTPModel {
  final String otp;
  final String userId;
  final String email;


  verifyOTPModel({
    required this.otp,
    required this.userId,
    required this.email

  });

  Map<String, dynamic> toJson(){
    return {
      "otp": otp,
      "userId": userId,
      "email": email,


    };
  }


}