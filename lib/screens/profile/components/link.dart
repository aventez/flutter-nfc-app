import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

class ProfileLink extends StatelessWidget {
  final Widget icon;
  final String platform;
  final String login;

  ProfileLink({
    @required this.icon,
    @required this.platform,
    @required this.login,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
      child: Container(
        width: size.width,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: palette.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.symmetric(horizontal: BorderSide.none),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 5),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(left: size.width * 0.013),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Row(
              children: [
                this.icon,
                SizedBox(width: 10),
                Text(
                  this.platform,
                  style: TextStyle(
                      fontSize: 17, color: Colors.black.withOpacity(0.75)),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.10),
                    child: Text(
                      this.login,
                      style: TextStyle(
                        fontSize: 17,
                        color: palette.textLightColor,
                      ),
                      textAlign: TextAlign.right,
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
