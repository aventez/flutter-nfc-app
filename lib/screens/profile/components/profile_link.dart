import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/screens/profile/components/link_icons.dart';
import 'package:idrop/screens/profile/components/link_state_text.dart';
import 'package:idrop/utils/contants.dart';
import 'package:provider/provider.dart';

class ProfileLink extends StatelessWidget {
  final String brand;
  final String name;

  const ProfileLink({
    @required this.brand,
    @required this.name,
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
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            brandKeys[this.brand],
                            style: TextStyle(fontSize: 20.0),
                          ),
                          ProfileLinkStateText(name: this.name),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: ProfileLinksIcons(name: name, brand: brand),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
