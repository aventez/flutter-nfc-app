import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:nfc_mobile/utils/clippers/semicircle.dart';
import 'package:nfc_mobile/utils/widgets/profile_avatar.dart';
import 'package:nfc_mobile/utils/widgets/profile_details.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Container(
      height: size.height * 0.31,
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: SemicircleClipper(),
            child: Container(
              height: size.height * 0.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    palette.secondaryColor.withOpacity(0.5),
                    Colors.grey.shade200
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.01),
                ProfileAvatar(
                  width: size.height * 0.2,
                  height: size.height * 0.2,
                ),
                ProfileDetails(
                  name: 'William',
                  login: 'aventez',
                  joined: '22/11/2020',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
