import 'package:flutter/material.dart';
import 'package:IDrop/models/screens/register_screen.dart';
import 'package:provider/provider.dart';

class RegisterRepeatPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegisterScreenModel>(context);
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: model.repeatPasswordFieldObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value != model.passwordFieldContent
          ? 'Password is not matching'
          : null,
      onChanged: (value) => model.repeatPasswordFieldContent = value,
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'Confirm password',
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: GestureDetector(
          child: model.repeatPasswordFieldObscure
              ? Icon(Icons.remove_red_eye)
              : Icon(Icons.remove_red_eye_outlined),
          onTap: () => model.toggleRepeatPasswordObscure(),
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
