import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/nfc/components/body.dart';
import 'package:nfc_mobile/utils/scaffolds/base.dart';

class NfcScreen extends StatefulWidget {
  @override
  NfcScreenState createState() => NfcScreenState();
}

class NfcScreenState extends State<NfcScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Body(),
    );
  }
}
