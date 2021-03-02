import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/screens/profile/components/profile_link.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    final profile = global.activeAccount.profile;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ProfileLink(
              brand: 'phoneNumber',
              name: '+48 530 936 262',
            ),
            ProfileLink(
              brand: 'phoneNumber',
              name: profile.phoneNumber,
            ),
          ],
        ),
      ),
    );
  }
}
