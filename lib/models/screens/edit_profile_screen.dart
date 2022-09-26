import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
//import 'package:permission_handler/permission_handler.dart';

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

    final result =
        await global.apiService.updateProfileSettings(global.activeProfileId, {
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

  void handleChangeAvatar() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final picker = ImagePicker();

    XFile file;

    bool storagePermission = await Permission.storage.request().isGranted;
    bool photosPermission = await Permission.photos.request().isGranted;

    if (storagePermission == true && photosPermission == true) {
      file = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 1500,
        maxWidth: 1500,
      );
    }

    if (file != null) {
      final result = await global.apiService.updateAvatar(
        global.activeProfileId,
        file.path,
      );
      if (result == true) {
        global.refreshUser();
      }
    } else {
      showOkAlert(
        context,
        'This app does not have access to your photos or videos. You can grant access in Privacy Settings.',
      );
    }
  }

  void handleDeleteAvatar() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final result = await global.apiService.deleteAvatar(global.activeProfileId);
    if (result == true) {
      global.refreshUser();
    }
  }
  /* Logic section end */
}
