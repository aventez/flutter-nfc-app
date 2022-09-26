import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/models/screens/switch_profile_screen.dart';
import 'package:IDrop/screens/switch_profile/components/profile_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final model = Provider.of<SwitchProfileScreenModel>(context);
    final palette = theme.getPalette();
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(size.width * 0.1),
      children: [
        SizedBox(height: size.height * 0.08),
        Center(
          child: Text(
            'On this page you can create up to 5 different profiles. The selected profile here is the profile you are currently sharing with your IDrop. One click switch, NO need to reactivate your tag. This feature enables you, for exemple, to have a Business Profile, a Private Profile and switch depending the situation.',
            style: TextStyle(color: palette.textLightColor),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * 0.04),
        Text(
          'Switch your profile',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.04),
        Column(
            children: global.activeAccount.profiles
                .map((profile) => ProfileRow(profile: profile))
                .toList()),
        ElevatedButton(
          onPressed: () {
            model.createProfile();
          },
          child: Icon(Icons.add, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(5),
            primary: theme.getPalette().primaryColor,
            onPrimary: theme.getPalette().secondaryColor,
          ),
        )
      ],
    );
  }
}
