import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/utils/alerts.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:provider/provider.dart';

class NfcScreenModel extends ChangeNotifier {
  BuildContext context;

  /* Variables section */
  static const platform = const MethodChannel('idrop.lib/nfc');

  Stream<NDEFTag> stream;
  bool supportsNfc = false;
  bool writingNfc = false;
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

    // Format and write URI to the tag

    if (Platform.isIOS) {
      final result = await platform.invokeMethod('writeNfc', path.toString());
      if (result == true) {
        showOkAlert(context, 'Your IDrop was successfully activated.');
      } else {
        showOkAlert(context, 'Failed to activate your IDrop tag.');
      }
    } else if (Platform.isAndroid) {
      if (this.writingNfc == false) {
        NDEFMessage newMessage = NDEFMessage.withRecords([
          NDEFRecord.uri(path),
        ]);

        showOkAlert(
          context,
          'You are writing your iDrop. Now close this window and hold your phone near a writable NFC tag to update.',
        );

        this.stream = NFC.writeNDEF(newMessage, once: true);
        this.stream.listen((NDEFTag tag) {
          showOkAlert(context, 'Your IDrop has been activated successfully.');
          this.writingNfc = false;
          this.refresh();
        });

        this.writingNfc = true;
      }

      this.refresh();
    } else {
      showOkAlert(
        context,
        'Undefined platform. Please contact support to get more information.',
      );
    }
  }
  /* Logic section end */
}
