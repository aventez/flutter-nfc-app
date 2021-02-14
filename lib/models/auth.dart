import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthModel with ChangeNotifier {
  var rootKey = UniqueKey();

  var activeAccount; // TODO: account system handling

  Future<void> init() async {
    notifyListeners();
  }

  int _activeTab = 0;
  int get activeTab => _activeTab;

  Future<void> setActiveTab(int index) async {
    _activeTab = index;
    notifyListeners();
  }
}
