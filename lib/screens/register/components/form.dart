import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/register_screen.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatelessWidget {
  Widget emailField(BuildContext context) {
    final model = Provider.of<RegisterScreenModel>(context);
    return TextFormField(
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'E-mail address',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().email().maxLength(32).build(),
      onChanged: (value) => model.emailFieldContent = value,
    );
  }

  Widget passwordField(BuildContext context) {
    final model = Provider.of<RegisterScreenModel>(context);
    return TextFormField(
      obscureText: model.passwordFieldObsure,
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: GestureDetector(
          child: model.passwordFieldObsure
              ? Icon(Icons.remove_red_eye)
              : Icon(Icons.remove_red_eye_outlined),
          onTap: () => model.toggleObscure(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(16).build(),
      onChanged: (value) => model.passwordFieldContent = value,
    );
  }

  Widget submitButton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<RegisterScreenModel>(context);
    return ElevatedButton(
      onPressed: () => !model.requestInQueue ? model.submitForm() : null,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(size.width, size.height * 0.08),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          Theme.of(context).primaryColor,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 17.0),
        ),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: Text('Sign up'.toUpperCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        emailField(context),
        SizedBox(height: size.height * 0.02),
        passwordField(context),
        SizedBox(height: size.height * 0.02),
        passwordField(context),
        SizedBox(height: size.height * 0.04),
        submitButton(context),
      ],
    );
  }
}
