import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/screens/register_screen.dart';
import 'package:provider/provider.dart';

class RegisterPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegisterScreenModel>(context);
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.visiblePassword,
      obscureText: model.passwordFieldObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(64).minLength(8).build(),
      onChanged: (value) => model.passwordFieldContent = value,
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: GestureDetector(
          child: model.passwordFieldObscure
              ? Icon(Icons.remove_red_eye)
              : Icon(Icons.remove_red_eye_outlined),
          onTap: () => model.togglePasswordObscure(),
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
