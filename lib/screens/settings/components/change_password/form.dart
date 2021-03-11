import 'package:flutter/material.dart';
import 'package:idrop/screens/settings/components/change_password/new_password_field.dart';
import 'package:idrop/screens/settings/components/change_password/old_password_field.dart';
import 'package:idrop/screens/settings/components/change_password/submit_button.dart';

class ChangePasswordForm extends StatefulWidget {
  @override
  ChangePasswordFormState createState() => ChangePasswordFormState();
}

class ChangePasswordFormState extends State<ChangePasswordForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          OldPasswordField(),
          SizedBox(height: size.height * 0.02),
          NewPasswordField(),
          SizedBox(height: size.height * 0.03),
          ChangePasswordSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
