import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;

  Logo({
    @required this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      width: this.width,
      height: this.height,
      image: AssetImage('assets/logo.png'),
    );
  }
}
