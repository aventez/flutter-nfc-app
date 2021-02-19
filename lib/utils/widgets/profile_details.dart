import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  final String name;
  final String login;
  final String joined;

  const ProfileDetails({
    @required this.name,
    @required this.login,
    @required this.joined,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();

    Widget _buildWelcomeText() {
      return Container(
        child: Text(
          'Hey, $name!',
          style: TextStyle(fontSize: 24.0),
        ),
      );
    }

    Widget _buildVerticalMargin() {
      return SizedBox(height: size.height * 0.01);
    }

    Widget _buildHorizontalMargin(double factor) {
      return SizedBox(width: size.height * factor);
    }

    Widget _buildDetails() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: palette.textLightColor,
            size: size.height * 0.025,
          ),
          _buildHorizontalMargin(0.01),
          Text(
            this.login,
            style: TextStyle(fontSize: 16.0, color: palette.textLightColor),
          ),
          _buildHorizontalMargin(0.02),
          Icon(
            Icons.calendar_today,
            color: palette.textLightColor,
            size: size.height * 0.025,
          ),
          _buildHorizontalMargin(0.01),
          Text(
            this.joined,
            style: TextStyle(
              fontSize: 16.0,
              color: palette.textLightColor,
            ),
          ),
        ],
      );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            _buildWelcomeText(),
            _buildVerticalMargin(),
            _buildDetails(),
          ],
        ),
      ),
    );
  }
}
