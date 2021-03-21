import 'dart:convert';
import 'package:idrop/json/user_basic.dart';
import 'package:idrop/json/user_settings.dart';
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

  Future<UserSettingsInfo> getUserSettingsInfo() async {
    final result = await this.apiStrategy.get('user/settings');
    if (result.statusCode == 200) {
      final user = UserSettingsInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Future<UserSettingsInfo> updateUserSettings(Map<String, dynamic> data) async {
    final result = await this.apiStrategy.post('user/settings', data);
    if (result.statusCode == 201) {
      final user = UserSettingsInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Future<bool> updateAvatar(path) async {
    final result = await this.apiStrategy.uploadFile('user/avatar', path);
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteAvatar() async {
    final result = await this.apiStrategy.delete('user/avatar');
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    final result = await this.apiStrategy.post(
      'auth/password-recovery',
      {'email': email},
    );
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> changePassword(String oldPassword, String newPassword) async {
    final result = await this.apiStrategy.post('auth/change-password', {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
    });
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> login(String email, String password) async {
    final result = await this.apiStrategy.post('auth/login', {
      'email': email,
      'password': password,
    });
    if (result.statusCode == 201) {
      return result.body;
    } else {
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
      return null;
    }
  }
}
