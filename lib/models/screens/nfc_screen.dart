import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/utils/alerts.dart';
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
    final accountId = global.profileData.id;
    final path = global.apiService.apiStrategy.getApiUri(
      'user/profile/$accountId',
    );

    if (Platform.isIOS) {
      final result = await platform.invokeMethod('writeNfc', path.toString());
    } else if (Platform.isAndroid) {
      if (this.writingNfc == false) {
        NDEFMessage newMessage = NDEFMessage.withRecords([
          NDEFRecord.uri(path),
        ]);

        showOkAlert(
          context,
          'You are activating your IDrop. Hold your IDrop behind your phone and wait for the success notification. (Activation zone depends on phones, most likely at the top or middle back of it.)',
        );

        this.stream = NFC.writeNDEF(newMessage, once: true);
        this.stream.listen((NDEFTag tag) {
          showOkAlert(
            context,
            'Your IDrop is successfully activated. You can now stick it on the desired area.',
          );
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
