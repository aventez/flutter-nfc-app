import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:provider/provider.dart';

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

  Future<void> writeNfc() async {
    final global = Provider.of<GlobalModel>(context, listen: false);
    final accountId = global.activeAccount.id;
    final path = global.apiService.apiStrategy.getApiUri(
      'user/profile/$accountId',
    );

    debugPrint(path.toString());

    NDEFMessage newMessage = NDEFMessage.withRecords([
      NDEFRecord.uri(path),
    ]);

    Stream<NDEFTag> stream = NFC.writeNDEF(newMessage, once: true);
    stream.listen((NDEFTag tag) {
      showOkAlert(context, 'NFC Tag was activated.');
    });
  }
  /* Logic section end */
}
