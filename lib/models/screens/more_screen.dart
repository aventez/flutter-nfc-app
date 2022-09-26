import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:provider/provider.dart';

class MoreScreenModel extends ChangeNotifier {
  BuildContext context;

  MoreScreenModel(this.context);

  /* Logic section */
  void refresh() => notifyListeners();

  void handleLogout() {
    final global = Provider.of<GlobalModel>(context, listen: false);
    global.updateJwt(null);
  }
  /* Logic section end */
}
