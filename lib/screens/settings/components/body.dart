import 'package:flutter/material.dart';
import 'package:idrop/screens/settings/components/change_password/form.dart';
import 'package:idrop/utils/widgets/footer.dart';
import 'package:idrop/screens/settings/components/theme_choose.dart';
import 'package:idrop/utils/widgets/section_header.dart';

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
            SizedBox(height: size.height * 0.02),
            Footer(),
          ],
        ),
      ),
    );
  }
}
