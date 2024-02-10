import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/screens/profile/components/link_icons.dart';
import 'package:IDrop/screens/profile/components/link_state_text.dart';
import 'package:IDrop/utils/contants.dart';
import 'package:provider/provider.dart';

class ProfileLink extends StatelessWidget {
  final String brand;
  final String name;
  final String message;

  const ProfileLink({
    @required this.brand,
    @required this.name,
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();

    final rowWidth = size.width;
    final rowHeight = size.height * 0.08;
    final opacity = name != null ? 1.0 : 0.35;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: rowWidth * 0.9,
          height: rowHeight,
          margin: EdgeInsets.only(left: rowWidth * 0.013),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10.0,
              ),
            ],
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
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brandKeys[this.brand],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: palette.primaryColor,
                        ),
                      ),
                      ProfileLinkStateText(name: this.name),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: ProfileLinksIcons(
                      name: name,
                      brand: brand,
                      message: message,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
