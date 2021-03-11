import 'package:flutter/material.dart';

class MoreScreenModel extends ChangeNotifier {
  BuildContext context;

  MoreScreenModel(this.context);

  /* Logic section */
  void refresh() => notifyListeners();
  /* Logic section end */
}
