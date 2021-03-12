import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:image_picker/image_picker.dart';
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

  void handleChangeAvatar() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final picker = ImagePicker();

    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      maxHeight: 1500,
      maxWidth: 1500,
    );
    if (pickedFile != null) {
      final result = await global.apiService.updateAvatar(
        pickedFile.path,
      );
      if (result == true) {
        global.refreshUser();
      }
    }
  }

  void handleDeleteAvatar() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final result = await global.apiService.deleteAvatar();
    if (result == true) {
      global.refreshUser();
    }
  }
  /* Logic section end */
}
