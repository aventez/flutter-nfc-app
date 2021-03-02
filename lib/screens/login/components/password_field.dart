import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:provider/provider.dart';

class LoginPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<LoginScreenModel>(context);
    return TextFormField(
      obscureText: model.passwordFieldObsure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(16).minLength(8).build(),
      onChanged: (value) => model.passwordFieldContent = value,
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
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
