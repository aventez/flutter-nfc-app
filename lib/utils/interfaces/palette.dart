import 'package:flutter/material.dart';

class Palette {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Color textLightColor;

  const Palette({
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.textColor,
    @required this.textLightColor,
  });
}
