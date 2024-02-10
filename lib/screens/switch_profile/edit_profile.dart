import 'package:flutter/material.dart';
import 'package:IDrop/screens/switch_profile/components/body.dart';
import 'package:IDrop/utils/scaffolds/base_scaffold.dart';

class SwitchProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Color(0xFFE96137)),
        child: Body(),
      ),
    );
  }
}
