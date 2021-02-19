import 'package:flutter/material.dart';
import 'package:nfc_mobile/logic/settings_screen.dart';

class SettingsScreenModel extends ChangeNotifier {
  SettingsScreenLogic logic;

  int selectedTheme = 1;

  SettingsScreenModel() {
    logic = SettingsScreenLogic(this);
  }

  void refresh() {
    notifyListeners();
  }
}
