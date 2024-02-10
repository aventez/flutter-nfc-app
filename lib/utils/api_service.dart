import 'dart:convert';
import 'package:IDrop/json/user_basic.dart';
import 'package:IDrop/json/profile_settings.dart';
import 'package:IDrop/utils/api_strategy.dart';
import 'package:flutter/material.dart';

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

  Future<ProfileSettingsInfo> getProfileData(String id) async {
    final result = await this.apiStrategy.get('profile/$id/data');
    if (result.statusCode == 200) {
      final user = ProfileSettingsInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Future<ProfileSettingsInfo> updateProfileSettings(
      String id, Map<String, dynamic> data) async {
    final result = await this.apiStrategy.put('profile/$id', data);
    if (result.statusCode == 200) {
      final user = ProfileSettingsInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Future<ProfileSettingsInfo> createProfile(Map<String, dynamic> data) async {
    final result = await this.apiStrategy.post('profile', data);
    if (result.statusCode == 201) {
      final user = ProfileSettingsInfo.fromJson(json.decode(result.body));
      return user;
    } else {
      return null;
    }
  }

  Future<bool> deleteProfile(String id) async {
    final result = await this.apiStrategy.delete('profile/$id');
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateActiveProfile(String id) async {
    final result = await this.apiStrategy.patch('profile/$id/default', {});
    debugPrint('Setting active response: ' + result.body);
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateAvatar(String id, path) async {
    final result =
        await this.apiStrategy.uploadFile('profile/$id/avatar', path);
    if (result.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteAvatar(String id) async {
    final result = await this.apiStrategy.delete('profile/$id/avatar');
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

  Future<bool> activatePremium(String code) async {
    final result = await this.apiStrategy.post(
      'user/activation',
      {'code': code},
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

  Future<bool> createWebsite(
    String activeProfileId,
    String websiteUrlContent,
    String iconContent,
    String nameContent,
  ) async {}
}
