import 'package:flutter/material.dart';
import 'package:idrop/models/screens/settings_screen.dart';
import 'package:idrop/screens/settings/components/footer.dart';
import 'package:idrop/screens/settings/components/theme_choose.dart';
import 'package:idrop/utils/widgets/section_header.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<SettingsScreenModel>(context);
    return Container(
      margin: EdgeInsets.all(15.0),
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ThemeChoose(),
            SectionHeader(
              title: Text(
                'Authentication',
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
              ),
              body: TextButton(
                child: Text('Sign-out'),
                onPressed: () => model.handleLogout(),
              ),
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
