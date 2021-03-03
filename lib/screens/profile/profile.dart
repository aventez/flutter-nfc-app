import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/screens/profile/components/body.dart';
import 'package:idrop/utils/scaffolds/common_scaffold.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    return CommonScaffold(
      body: Body(),
      actions: [
        TextButton(
          child: Text(
            'Edit',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return global.providerConfig.getEditProfileScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
