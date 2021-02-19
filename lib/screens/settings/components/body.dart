import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/settings/components/footer.dart';
import 'package:nfc_mobile/screens/settings/components/section.dart';
import 'package:nfc_mobile/screens/settings/components/theme_choose.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ThemeChoose(),
            Section(
              title: Text(
                'Authentication',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              body: TextButton(
                child: Text('Sign-out'),
                onPressed: () => {},
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
