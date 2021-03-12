import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:provider/provider.dart';

class SettingsScreenModel extends ChangeNotifier {
  BuildContext context;

  SettingsScreenModel(this.context);

  /* Variables section */
  String oldPasswordFieldContent;
  String newPasswordFieldContent;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  void submitChangePasswordForm() async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    final result = await global.apiService.changePassword(
      oldPasswordFieldContent,
      newPasswordFieldContent,
    );
    if (result == true) {
      showOkAlert(context, 'Your password has been changed.');
    } else {
      showOkAlert(context, 'Old password does not match.');
      // notification old password does not match
    }
  }
  /* Logic section end */
}
