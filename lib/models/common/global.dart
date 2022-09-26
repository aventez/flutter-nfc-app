import 'dart:convert';

import 'package:IDrop/exceptions/authorization_failed_exception.dart';
import 'package:IDrop/json/user_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:IDrop/json/profile_settings.dart';
import 'package:IDrop/utils/api_service.dart';
import 'package:IDrop/utils/providers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:connectivity/connectivity.dart';

class GlobalModel with ChangeNotifier {
  GlobalModel();

  /* Variables section */
  UniqueKey rootKey = UniqueKey();
  PersistentTabController controller;
  ProviderConfig providerConfig;
  ApiService apiService;

  UserBasicInfo activeAccount;
  ProfileSettingsInfo profileData;
  String activeProfileId;
  String jwtToken;

  bool loadingUser = false;
  bool networkConnectivity = false;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  Future<void> init() async {
    this.controller = PersistentTabController(initialIndex: 0);
    this.providerConfig = ProviderConfig.getInstance();

    /* We don't want to store sensitive data in shared preferenes; then now
       we're using Secure Storage (Keychain for iOS, AES encryption for Android)
    */
    final storage = new FlutterSecureStorage();
    jwtToken = await storage.read(key: 'auth:jwt');

    /* Network connectivity stream and initialize user */
    await checkNetworkConnectivity();

    apiService = ApiService(jwtToken);
    if (networkConnectivity && jwtToken != null) {
      refreshUser();
    } else {
      refresh();
    }
  }

  Future<void> checkNetworkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    networkConnectivity = result != ConnectivityResult.none;

    refresh();
  }

  void refreshUser() async {
    if (networkConnectivity) {
      loadingUser = true;
      refresh();

      activeAccount = await apiService.getUserBasicInfo();
      if (activeAccount == null) {
        loadingUser = false;
        refresh();
        return;
      }

      var contain = activeAccount.profiles
          .where((element) => element.id == activeAccount.activeProfileId);

      if (contain.isEmpty) activeProfileId = activeAccount.profiles.first.id;

      if (activeProfileId == null) {
        if (activeAccount.activeProfileId == null) {
          await this
              .apiService
              .updateActiveProfile(activeAccount.profiles.first.id);

          activeProfileId = activeAccount.profiles.first.id;

          debugPrint('updating active');
        } else {
          activeProfileId = activeAccount.activeProfileId;

          debugPrint('active is ' + activeProfileId);
        }
      }

      profileData = await apiService.getProfileData(activeProfileId);

      debugPrint('Active profile is: ' + activeProfileId);

      loadingUser = false;
    }

    refresh();
  }

  void updateJwt(String newToken) async {
    jwtToken = newToken;
    apiService = ApiService(jwtToken);

    final storage = new FlutterSecureStorage();
    storage.write(key: 'auth:jwt', value: jwtToken);

    refreshUser();
  }
  /* Logic section end */
}
