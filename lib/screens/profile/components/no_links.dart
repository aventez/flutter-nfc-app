import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:nfc_mobile/utils/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class NoLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You do not have any links added to your account yet.',
            style: TextStyle(
              color: palette.textLightColor,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.13),
          RoundedButton(
            icon: Icon(Icons.add),
            content: 'Connect your first link',
            backgroundColor: palette.secondaryColor,
            textColor: palette.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
