import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AuthModel with ChangeNotifier {
  var rootKey = UniqueKey();

  Future<void> init() async {
    notifyListeners();
  }
}