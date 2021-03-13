import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/utils/clippers/semicircle_clipper.dart';
import 'package:idrop/utils/widgets/profile_avatar.dart';
import 'package:idrop/utils/widgets/profile_details.dart';
import 'package:provider/provider.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final global = Provider.of<GlobalModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    return Container(
      height: size.height * 0.39,
      width: size.width,
      child: Stack(
        children: [
          ClipPath(
            clipper: SemicircleClipper(),
            child: Container(
              height: size.height * 0.26,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header_texture.png'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                    Colors.white.withOpacity(0.2),
                    BlendMode.dstATop,
                  ),
                ),
                color: palette.primaryColor,
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.08),
                ProfileAvatar(
                  radius: size.height * 0.1,
                  avatarUrl: global.activeAccount.avatarURL,
                ),
                ProfileDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
