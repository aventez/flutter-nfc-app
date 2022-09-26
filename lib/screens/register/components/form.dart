import 'package:flutter/material.dart';
import 'package:IDrop/screens/register/components/email_field.dart';
import 'package:IDrop/screens/register/components/password_field.dart';
import 'package:IDrop/screens/register/components/repeat_password_field.dart';
import 'package:IDrop/screens/register/components/submit_button.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:IDrop/utils/widgets/checkbox_form_field.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final formKey = GlobalKey<FormState>();

  final termsUrl =
      'https://www.idropsocial.com/application-terms-and-conditions';

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
            title: GestureDetector(
              onTap: () async {
                if (await canLaunch(termsUrl)) {
                  await launch(termsUrl);
                } else {
                  showOkAlert(context, 'Unfortunately, could not launch URL.');
                }
              },
              child: Text(
                'I agree to our Master Services Agreement and acknowledge our Privacy Policy.',
                style: TextStyle(fontSize: 12.0),
              ),
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
