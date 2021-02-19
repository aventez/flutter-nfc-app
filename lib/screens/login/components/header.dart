import 'package:flutter/material.dart';

class SignInHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: new TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        children: <TextSpan>[
          TextSpan(text: 'Sign in'),
        ],
      ),
    );
  }
}
