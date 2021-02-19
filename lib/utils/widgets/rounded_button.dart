import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  final Color textColor;
  final TextStyle textStyle;
  final Icon icon;
  final EdgeInsetsGeometry padding;
  final Function onPressed;
  final BorderRadiusGeometry borderRadius;

  const RoundedButton({
    @required this.content,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.onPressed,
    this.icon,
    this.padding,
    this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: icon ?? Container(),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: this.textColor,
        backgroundColor: this.backgroundColor,
        padding: this.padding,
        shape: RoundedRectangleBorder(
          borderRadius: this.borderRadius,
        ),
      ),
      label: Text(
        content,
        style: this.textStyle ?? TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
