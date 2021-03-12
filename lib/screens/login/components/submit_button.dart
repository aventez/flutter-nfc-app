import 'package:flutter/material.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:provider/provider.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    @required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<LoginScreenModel>(context);
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          model.submitForm();
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size.width),
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
      child: Text('Sign in'.toUpperCase()),
    );
  }
}
