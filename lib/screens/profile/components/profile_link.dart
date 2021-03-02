import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/utils/contants.dart';
import 'package:provider/provider.dart';

class ProfileLink extends StatelessWidget {
  final String brand;
  final String name;

  const ProfileLink({
    @required this.brand,
    @required this.name,
  });

  Widget buildIconsRow(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    return name != null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.edit, color: palette.textColor),
              SizedBox(width: size.width * 0.05),
              Icon(Icons.delete, color: palette.textColor),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.add, color: palette.textColor),
            ],
          );
  }

  Widget buildBottomText(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    return name != null
        ? Row(
            children: [
              Text(
                'Linked',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(width: size.width * 0.01),
              Text(
                '(f.szymanski3)',
                style: TextStyle(
                  fontSize: 13.0,
                  color: palette.textLightColor,
                ),
              ),
            ],
          )
        : Text(
            'Unlinked',
            style: TextStyle(
              fontSize: 13.0,
              color: Colors.red,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    final rowWidth = size.width;
    final rowHeight = size.height * 0.08;
    final opacity = name != null ? 1.0 : 0.35;

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: [
          Container(
            width: rowWidth,
            height: rowHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: palette.primaryColor.withOpacity(opacity),
            ),
          ),
          Container(
            width: rowWidth,
            height: rowHeight,
            margin: EdgeInsets.only(left: rowWidth * 0.013),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
              color: Colors.grey.shade100,
            ),
            child: Opacity(
              opacity: opacity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: rowWidth * 0.05),
                  Image.asset(
                    'assets/icons/$brand.png',
                    width: rowWidth * 0.09,
                  ),
                  SizedBox(width: rowWidth * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandKeys[this.brand],
                        style: TextStyle(fontSize: 20.0),
                      ),
                      buildBottomText(context),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 25.0),
                      child: buildIconsRow(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
