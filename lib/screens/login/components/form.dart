import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline),
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
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Color(0xFFf5f5f5),
        filled: true,
        prefixIcon: Icon(Icons.lock_outline),
        prefixStyle: TextStyle(
          color: Colors.black,
        ),
        suffixIcon: Icon(Icons.remove_red_eye),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _emailField(),
          SizedBox(height: size.height * 0.03),
          _passwordField(),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            width: size.width,
            height: size.height * 0.08,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {}
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFBA9B5C)),
              ),
              child: Text('SIGN IN'),
            ),
          ),
        ],
      ),
    );
  }
}
