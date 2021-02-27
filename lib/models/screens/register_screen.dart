import 'package:flutter/material.dart';

class RegisterScreenModel extends ChangeNotifier {
  RegisterScreenModel();

  /* Variables section */
  String emailFieldContent;
  String passwordFieldContent;
  bool passwordFieldObsure = true;
  bool requestInQueue = false;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  void toggleObscure() {
    passwordFieldObsure = !passwordFieldObsure;
    refresh();
  }

  void submitForm() async {
    requestInQueue = true;
    refresh();

    await Future.delayed(Duration(seconds: 1));

    requestInQueue = false;
    refresh();
  }
  /* Logic section end */
}
