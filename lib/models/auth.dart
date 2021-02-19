import 'package:flutter/material.dart';

class AuthModel with ChangeNotifier {
  var rootKey = UniqueKey();

  var activeAccount; // TODO: account system handling

  Future<void> init() async {
    notifyListeners();
  }
}
