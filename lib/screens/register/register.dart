import 'package:flutter/material.dart';
import 'package:idrop/screens/register/components/body.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Color(0xFFBA9B5C)),
        child: Body(),
      ),
    );
  }
}
