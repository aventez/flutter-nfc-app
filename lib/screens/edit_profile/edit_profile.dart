import 'package:flutter/material.dart';
import 'package:IDrop/screens/edit_profile/components/body.dart';
import 'package:IDrop/utils/scaffolds/base_scaffold.dart';

class EditProfileScreen extends StatelessWidget {
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
