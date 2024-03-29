import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:IDrop/utils/widgets/brand_logo.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0),
      child: Column(
        children: [
          BrandLogo(
            width: size.width * 0.2,
            black: false,
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Version 1.0',
                  style: TextStyle(color: palette.textLightColor)),
              SizedBox(width: size.width * 0.03),
              Text('IDrop SARL',
                  style: TextStyle(color: palette.textLightColor)),
            ],
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    );
  }
}
