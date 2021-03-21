import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class OfflineScreenModel extends ChangeNotifier {
  BuildContext context;

  OfflineScreenModel(this.context);

  /* Logic section */
  void refresh() => notifyListeners();

  void handleClick() async {
    final global = Provider.of<GlobalModel>(context, listen: false);

    global.checkNetworkConnectivity();
  }
  /* Logic section end */
}
