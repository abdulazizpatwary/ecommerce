import 'dart:convert';

import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  String? accessToken;
  UserModel? userModel;
  final String _tokenKey = "token_key";
  final String _userModelKey = "user_model_key";

  Future<void> saveUserData(String token, UserModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(
      _userModelKey,
      jsonEncode(model.toJson()),
    );
    accessToken = token;
    userModel = model;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userModelKey);
    if (token != null) {
      accessToken = token;
    }
    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<bool> isUserLoggedIn() async {
    bool loggedIn = false;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    if (token != null) {
      await getUserData();
      loggedIn = true;
    }
    return loggedIn;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
  bool isValidUser(){
    return accessToken !=null;
  }
}
