import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();

    return RichText(
      text: TextSpan(
        style: new TextStyle(
          fontSize: 25.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Sign in to '),
          TextSpan(text: 'IDrop', style: TextStyle(color: palette.primaryColor))
        ],
      ),
    );
  }
}
