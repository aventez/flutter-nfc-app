import 'package:flutter/material.dart';

class NfcScreenModel extends ChangeNotifier {
  NfcScreenModel();

  void refresh() {
    notifyListeners();
  }
}
