class VerifyOtpRequestModel {
  final String _email;
  final String _otp;

  VerifyOtpRequestModel({required String email, required String otp}) : _email = email, _otp = otp;



  Map<String,dynamic>toJson(){
    return{
      "email":_email,
      "otp":_otp

    };
  }

}