import 'package:flutter/material.dart';
import 'package:idrop/screens/register/components/email_field.dart';
import 'package:idrop/screens/register/components/password_field.dart';
import 'package:idrop/screens/register/components/repeat_password_field.dart';
import 'package:idrop/screens/register/components/submit_button.dart';
import 'package:idrop/utils/widgets/checkbox_form_field.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterEmailField(),
          SizedBox(height: size.height * 0.02),
          RegisterPasswordField(),
          SizedBox(height: size.height * 0.02),
          RegisterRepeatPasswordField(),
          CheckboxFormField(
            title: Text(
              'I agree to our Master Services Agreement and acknowledge our Privacy Policy.',
              style: TextStyle(fontSize: 12.0),
            ),
            validator: (value) =>
                value == false ? 'The field is required' : null,
          ),
          SizedBox(height: size.height * 0.02),
          RegisterSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
