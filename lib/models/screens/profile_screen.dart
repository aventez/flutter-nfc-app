import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class ProfileScreenModel extends ChangeNotifier {
  BuildContext context;

  ProfileScreenModel(this.context);

  /* Logic section */
  void refresh() => notifyListeners();

  void onUserEditLink(String brand, String account) async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    final result = await global.apiService.updateUserSettings({brand: account});
    if (result != null) {
      global.refreshUser();
    }

    refresh();
  }
  /* Logic section end */
}
