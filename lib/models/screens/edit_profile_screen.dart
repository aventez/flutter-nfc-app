import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class EditProfileScreenModel extends ChangeNotifier {
  BuildContext context;

  EditProfileScreenModel(this.context);

  /* Variables section */
  String nameFieldContent = '';
  String jobFieldContent = '';
  bool requestInQueue = false;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  void submitForm() async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    requestInQueue = true;
    refresh();

    final result = await global.apiService.updateUserSettings({
      'name': nameFieldContent,
      'job': jobFieldContent ?? '',
    });
    if (result != null) {
      global.refreshUser();
      Navigator.of(context).pop();
    }

    requestInQueue = false;
    refresh();
  }
  /* Logic section end */
}
