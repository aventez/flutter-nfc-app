import 'dart:async';
import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:provider/provider.dart';

class NfcScreenModel extends ChangeNotifier {
  BuildContext context;

  /* Variables section */
  StreamSubscription<NDEFTag> streamSubscription;
  bool supportsNfc = false;
  /* Variables section end */

  /* Logic section */
  NfcScreenModel(this.context) {
    NFC.isNDEFSupported.then((value) {
      supportsNfc = true;
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

    // First format the tag
    NDEFMessage message = NDEFMessage.withRecords([]);
    Stream<NDEFTag> stream = NFC.writeNDEF(message, once: true);
    stream.listen((NDEFTag tag) async {
      showOkAlert(context, 'NFC tag formatted');
      await tag.write(NDEFMessage.withRecords([NDEFRecord.uri(path)]));
      showOkAlert(context, 'NFC tag activated');
    });
  }
  /* Logic section end */
}
