import 'package:flutter/material.dart';

class ProfileScreenModel extends ChangeNotifier {
  ProfileScreenModel();

  void refresh() {
    notifyListeners();
  }
}
