import 'package:flutter/material.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:provider/provider.dart';

class LoginRecoverPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginScreenModel>(context);
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () async {
          model.handleResetPassword();
        },
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Colors.grey, fontSize: 13.0),
        ),
      ),
    );
  }
}
