import 'package:flutter/material.dart';
import 'package:idrop/screens/nfc/components/body.dart';
import 'package:idrop/utils/scaffolds/common_scaffold.dart';

class NfcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Body(),
    );
  }
}
