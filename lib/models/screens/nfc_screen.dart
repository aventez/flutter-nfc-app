import 'package:flutter/material.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class NfcScreenModel extends ChangeNotifier {
  BuildContext context;

  /* Variables section */
  bool supportsNfc = false;
  /* Variables section end */

  /* Logic section */
  NfcScreenModel(this.context) {
    NFC.isNDEFSupported.then((value) {
      supportsNfc = value;
      refresh();
    });
  }

  void refresh() => notifyListeners();
  /* Logic section end */
}
