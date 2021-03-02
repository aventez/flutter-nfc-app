import 'package:flutter/material.dart';

class BrandLogo extends StatelessWidget {
  final double width;
  final double height;
  final bool black;

  BrandLogo({
    @required this.width,
    this.height,
    this.black = false,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: this.width,
      height: this.height,
      image: AssetImage(
        black ? 'assets/logo_black.png' : 'assets/logo_color.png',
      ),
    );
  }
}
