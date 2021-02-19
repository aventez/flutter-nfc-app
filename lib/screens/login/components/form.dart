import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:nfc_mobile/utils/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'E-mail',
      ),
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter some text';
        else
          return null;
      },
    );
  }

  Widget _passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.remove_red_eye),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelText: 'Password',
      ),
      validator: (value) {
        if (value.isEmpty)
          return 'Please enter some text';
        else
          return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _emailField(),
          SizedBox(height: size.height * 0.03),
          _passwordField(),
          SizedBox(height: size.height * 0.04),
          SizedBox(
            width: size.width * 0.30,
            height: size.height * 0.05,
            child: RoundedButton(
              textColor: Colors.white,
              content: 'Sign in',
              backgroundColor: palette.primaryColor,
              onPressed: () => {},
              borderRadius: BorderRadius.circular(8.0),
              textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          RichText(
            text: TextSpan(
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: 'Do not have an account yet? '),
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    color: palette.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Text(
            'I forget the password.',
            style: TextStyle(color: palette.textLightColor),
          ),
        ],
      ),
    );
  }
}
