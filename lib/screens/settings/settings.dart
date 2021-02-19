import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/settings/components/body.dart';
import 'package:nfc_mobile/utils/scaffolds/base.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Body(),
    );
  }
}
