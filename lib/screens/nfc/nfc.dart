import 'package:flutter/material.dart';
import 'package:IDrop/screens/nfc/components/body.dart';
import 'package:IDrop/utils/scaffolds/common_scaffold.dart';

class NfcScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Body(),
    );
  }
}
