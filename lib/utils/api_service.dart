import 'package:flutter/cupertino.dart';
import 'package:idrop/utils/api_strategy.dart';

class ApiService {
  final String token;
  ApiStrategy apiStrategy;

  ApiService(this.token) {
    this.apiStrategy = ApiStrategy(this.token);
  }

  /* Logic section */
  Future<String> getUserBasicInfo() async {
    final result = await this.apiStrategy.get('user/info');
    debugPrint(result);
    return result;
  }

  Function getUserSettingsInfo() {}
  Function updateUserSettingsInfo() {}
  Function login() {}
  Function register() {}
}
