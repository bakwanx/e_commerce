import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../utils/prefs_key.dart';

class AuthProvider with ChangeNotifier{
  UserModel? _userModel;
  int _userId = 0;
  bool _isLoading = false;
  File? _photoProfile;

  bool get isLoading => _isLoading;
  int get userId => _userId;
  File? get photoProfile => _photoProfile;
  UserModel? get userModel => _userModel;

  Future<bool> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _userModel = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString(KEY_TOKEN, userModel!.token.toString());

      _userModel = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateProfile({
    String? name,
    String? username,
    String? email,
    String? token
  }) async {

    try {
      await AuthService().updateProfile(
        name: name,
        username: username,
        email: email,
        token: token
      );
      return true;
    } catch (e) {
      print(e);
      return false;
    }

  }

}