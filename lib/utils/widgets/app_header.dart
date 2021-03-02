import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/utils/clippers/semicircle_clipper.dart';
import 'package:idrop/utils/widgets/profile_avatar.dart';
import 'package:idrop/utils/widgets/profile_details.dart';
import 'package:provider/provider.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    return Container(
      height: size.height * 0.4,
      width: size.width,
      child: Stack(
        children: [
          ClipPath(
            clipper: SemicircleClipper(),
            child: Container(
              height: size.height * 0.28,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header_texture.png'),
                  fit: BoxFit.cover,
                  colorFilter: new ColorFilter.mode(
                      Colors.white.withOpacity(0.2), BlendMode.dstATop),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    palette.secondaryColor.withOpacity(0.5),
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: size.height * 0.11),
                ProfileAvatar(
                  width: size.height * 0.2,
                  height: size.height * 0.2,
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
