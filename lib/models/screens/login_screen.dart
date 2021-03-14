import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
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

  void handleResetPassword() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final text = await showTextInputDialog(
      context: context,
      textFields: [
        DialogTextField(
          validator:
              ValidationBuilder().minLength(2).maxLength(64).email().build(),
        ),
      ],
      title: 'Forgot password?',
      message: 'Enter your e-mail below to start account recovery procedure.',
      okLabel: 'Recover',
      cancelLabel: 'Cancel',
    );

    if (text != null) {
      final result = await global.apiService.resetPassword(text[0]);
      if (result) {
        showOkAlert(
          context,
          'E-mail has been sent. Check your inbox for new password.',
        );
      } else {
        showOkAlert(
          context,
          'Unfortunately, there is no account connected with this email.',
        );
      }
    }
  }
  /* Logic section end */
}
