import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:idrop/utils/api_service.dart';
import 'package:idrop/utils/providers.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class GlobalModel with ChangeNotifier {
  GlobalModel();

  /* Variables section */
  UniqueKey rootKey = UniqueKey();
  PersistentTabController controller;
  ProviderConfig providerConfig;
  ApiService apiService;

  var activeAccount;
  String jwtToken;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  Future<void> init() async {
    /* We don't want to store sensitive data in shared preferenes; then now
       we're using Secure Storage (Keychain for iOS, AES encryption for Android)
    */
    final storage = new FlutterSecureStorage();
    jwtToken = await storage.read(key: 'auth:jwt');
    if (jwtToken != null) {
      apiService = ApiService(jwtToken);
      activeAccount = await apiService.getUserBasicInfo();
    } else {
      activeAccount = null;
    }

    this.controller = PersistentTabController(initialIndex: 0);
    this.providerConfig = ProviderConfig.getInstance();

    refresh();
  }
  /* Logic section end */
}
