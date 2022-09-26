import 'package:flutter/material.dart';
import 'package:IDrop/screens/settings/components/change_password/form.dart';
import 'package:IDrop/utils/widgets/footer.dart';
import 'package:IDrop/screens/settings/components/theme_choose.dart';
import 'package:IDrop/utils/widgets/section_header.dart';

import 'activate_premium/form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: size.width,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ThemeChoose(),
            SectionHeader(
              title: Text(
                'Change password',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              body: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ChangePasswordForm(),
              ),
            ),
            SectionHeader(
              title: Text(
                'Activation code',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              body: Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ActivatePremiumForm(),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Footer(),
          ],
        ),
      ),
    );
  }
}
