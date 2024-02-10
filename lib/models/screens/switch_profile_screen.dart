import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
//import 'package:permission_handler/permission_handler.dart';

class SwitchProfileScreenModel extends ChangeNotifier {
  BuildContext context;

  SwitchProfileScreenModel(this.context);

  /* Variables section */
  String nameFieldContent = '';
  String jobFieldContent = '';
  bool requestInQueue = false;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  void createProfile() async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    requestInQueue = true;
    refresh();

    final result = await global.apiService.createProfile({
      'name': 'New profile',
      'job': null,
    });
    if (result != null) {
      global.refreshUser();
      // Navigator.of(context).pop();
    } else {
      showOkAlert(context, 'You can\'t have more than 5 profiles.');
    }

    requestInQueue = false;
    refresh();
  }

  void deleteProfile(String id) async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    refresh();
    await global.apiService.deleteProfile(id);
    refresh();
  }
  /* Logic section end */
}
