import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:provider/provider.dart';

class LoginScreenModel extends ChangeNotifier {
  BuildContext context;

  LoginScreenModel(this.context);

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
    final global = Provider.of<GlobalModel>(context, listen: false);

    requestInQueue = true;
    refresh();

    final result = await global.apiService.login(
      emailFieldContent,
      passwordFieldContent,
    );
    if (result != null) {
      global.updateJwt(result);
    } else {
      showOkAlert(context, 'Wrong credentials provided');
    }

    requestInQueue = false;
    refresh();
  }
  /* Logic section end */
}
