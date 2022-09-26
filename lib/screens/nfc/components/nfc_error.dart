import 'package:flutter/material.dart';
import 'package:IDrop/models/common/theme.dart';
import 'package:provider/provider.dart';

class NfcError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();
    return Padding(
      padding: EdgeInsets.all(45.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/nfc_error.png', height: size.height * 0.15),
          SizedBox(
            height: size.height * 0.03,
          ),
          Text(
            'Oh, something went wrong!',
            style: TextStyle(
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              color: palette.primaryColor,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            'Unfortunately, your device does not support NFC. Try to enable your NFC connection.',
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
