import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String content;
  final Color backgroundColor;
  final Color textColor;
  final Icon icon;
  final EdgeInsetsGeometry padding;
  final Function onPressed;

  const RoundedButton({
    @required this.content,
    @required this.backgroundColor,
    @required this.textColor,
    @required this.onPressed,
    this.icon,
    this.padding,
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
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      label: Text(
        content,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
