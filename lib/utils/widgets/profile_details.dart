import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final global = Provider.of<GlobalModel>(context);
    final palette = theme.getPalette();

    final name = global.activeAccount.name;
    final job = global.activeAccount.job;

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
            Icons.work,
            color: palette.textLightColor,
            size: size.height * 0.025,
          ),
          _buildHorizontalMargin(0.01),
          Text(
            job,
            style: TextStyle(fontSize: 16.0, color: palette.textLightColor),
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
