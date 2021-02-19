import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:nfc_mobile/utils/widgets/logo.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          Logo(width: size.width * 0.2),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Version 1.011',
                  style: TextStyle(color: palette.textLightColor)),
              SizedBox(width: size.width * 0.03),
              Text('IDrop Ltd.',
                  style: TextStyle(color: palette.textLightColor)),
            ],
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}
