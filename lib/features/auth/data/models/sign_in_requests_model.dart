class SignInRequestModel {
  final String _email;
  final String _password;

  SignInRequestModel({required String email, required String password})
      : _email = email,
        _password = password;

  Map<String, dynamic> toJson() {
    return {"email": _email, "password": _password};
  }
}
