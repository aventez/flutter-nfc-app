import 'package:flutter/material.dart';
import 'package:idrop/screens/profile/components/body.dart';
import 'package:idrop/utils/scaffolds/common_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Body(),
    );
  }
}
