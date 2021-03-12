import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:provider/provider.dart';

class RegisterScreenModel extends ChangeNotifier {
  /* Variables section */
  String emailFieldContent;
  String passwordFieldContent;
  String repeatPasswordFieldContent;
  bool passwordFieldObscure = true;
  bool repeatPasswordFieldObscure = true;
  bool requestInQueue = false;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  void togglePasswordObscure() {
    passwordFieldObscure = !passwordFieldObscure;
    refresh();
  }

  void toggleRepeatPasswordObscure() {
    repeatPasswordFieldObscure = !repeatPasswordFieldObscure;
    refresh();
  }

  void submitForm(BuildContext context) async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    requestInQueue = true;
    refresh();

    final result = await global.apiService.register(
      emailFieldContent,
      passwordFieldContent,
    );

    if (result != null) {
      global.updateJwt(result);
      Navigator.of(context).pop();
    } else {
      showOkAlert(context, 'Account with that email already exists');
    }

    requestInQueue = false;
    refresh();
  }
  /* Logic section end */
}
