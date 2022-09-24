import 'dart:convert';
import 'dart:io';

import 'package:e_commerce/services/headers.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../utils/api_path.dart';
class AuthService {

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      uriLogin(),
      headers: headers(),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> register({
    String? name,
    String? username,
    String? email,
    String? password,
  }) async {

    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      uriRegister(),
      headers: headers(),
      body: body,
    );

    print("pesan ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> updateProfile({
    String? name,
    String? username,
    String? email,
    String? token
  }) async {

    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email
    });

    var response = await http.post(
      uriUpdateUser(),
      headers: headersToken(token),
      body: body,
    );

    print("pesan ${response.body}");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
}