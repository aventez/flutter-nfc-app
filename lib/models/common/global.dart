import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:idrop/json/user_settings.dart';
import 'package:idrop/utils/api_service.dart';
import 'package:idrop/utils/providers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:connectivity/connectivity.dart';

class GlobalModel with ChangeNotifier {
  GlobalModel();

  /* Variables section */
  UniqueKey rootKey = UniqueKey();
  PersistentTabController controller;
  ProviderConfig providerConfig;
  ApiService apiService;

  UserSettingsInfo activeAccount;
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

      activeAccount = await apiService.getUserSettingsInfo();
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
