import 'package:flutter/material.dart';
import 'package:nfc_mobile/logic/theme.dart';

class ThemeModel extends ChangeNotifier {
  ThemeLogic logic;

  ThemeModel() {
    logic = ThemeLogic(this);
  }

  int themeId = 1;

  void refresh() {
    notifyListeners();
  }

  Future<void> init() async {
    notifyListeners();
  }
}
