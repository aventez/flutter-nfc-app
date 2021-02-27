import 'package:flutter/material.dart';

class SettingsScreenModel extends ChangeNotifier {
  SettingsScreenModel();

  void refresh() {
    notifyListeners();
  }
}
