import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/screens/profile/components/body.dart';
import 'package:IDrop/utils/scaffolds/common_scaffold.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    final profilesCount = global.activeAccount.profiles.length;
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
        TextButton(
          child: Text(
            profilesCount == 1 ? 'Add profile' : 'Switch',
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
                  return global.providerConfig.getSwitchProfileScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
