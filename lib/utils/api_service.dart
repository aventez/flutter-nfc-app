import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:idrop/json/user_basic.dart';
import 'package:idrop/utils/api_strategy.dart';

class ApiService {
  final String token;
  ApiStrategy apiStrategy;

  ApiService(this.token) {
    this.apiStrategy = ApiStrategy(this.token);
  }

  /* Logic section */
  Future<UserBasicInfo> getUserBasicInfo() async {
    final result = await this.apiStrategy.get('user/info');
    if (result.statusCode == 200) {
      final user = UserBasicInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Function getUserSettingsInfo() {}
  Function updateUserSettingsInfo() {}

  Future<String> login(String email, String password) async {
    final result = await this.apiStrategy.post('auth/login', {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 201) {
      return result.body;
    } else {
      await Fluttertoast.showToast(
        msg: "Wrong credentials provided",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        fontSize: 16.0,
      );

      return null;
    }
  }

  Future<String> register(String email, String password) async {
    final result = await this.apiStrategy.post('auth/register', {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 201) {
      return result.body;
    } else {
      await Fluttertoast.showToast(
        msg: "Account with that email already exists",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        fontSize: 16.0,
      );

      return null;
    }
  }
}
