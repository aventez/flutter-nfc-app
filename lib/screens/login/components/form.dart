import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:idrop/screens/login/components/email_field.dart';
import 'package:idrop/screens/login/components/password_field.dart';
import 'package:idrop/screens/login/components/recover_password.dart';
import 'package:idrop/screens/login/components/submit_button.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoginEmailField(),
          SizedBox(height: size.height * 0.02),
          LoginPasswordField(),
          SizedBox(height: size.height * 0.01),
          LoginRecoverPassword(),
          SizedBox(height: size.height * 0.04),
          LoginSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
