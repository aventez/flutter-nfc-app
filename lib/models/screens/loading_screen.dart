import 'package:flutter/material.dart';

class LoadingScreenModel extends ChangeNotifier {
  BuildContext context;

  LoadingScreenModel(this.context);

  /* Logic section */
  void refresh() => notifyListeners();
  /* Logic section end */
}
