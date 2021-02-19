import 'package:flutter/material.dart';
import 'package:nfc_mobile/logic/profile_screen.dart';

class ProfileScreenModel extends ChangeNotifier {
  ProfileScreenLogic logic;

  ProfileScreenModel() {
    logic = ProfileScreenLogic(this);
  }

  void refresh() {
    notifyListeners();
  }
}
