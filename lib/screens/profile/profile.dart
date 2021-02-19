import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/profile/components/body.dart';
import 'package:nfc_mobile/utils/scaffolds/base.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Body(),
    );
  }
}
