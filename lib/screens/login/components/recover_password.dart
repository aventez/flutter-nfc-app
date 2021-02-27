import 'package:flutter/material.dart';

class LoginRecoverPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.grey, fontSize: 13.0),
      ),
    );
  }
}
