import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
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

  void handleLogout() {
    final global = Provider.of<GlobalModel>(context, listen: false);
    global.updateJwt(null);
  }

  void submitChangePasswordForm() {
    final global = Provider.of<GlobalModel>(context, listen: false);
  }
  /* Logic section end */
}
