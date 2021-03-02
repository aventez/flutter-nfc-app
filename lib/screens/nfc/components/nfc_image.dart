import 'package:flutter/material.dart';

class NfcImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Image.asset(
      'assets/nfc_tag.png',
      width: size.width * 0.4,
    );
  }
}
