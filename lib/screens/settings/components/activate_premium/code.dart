import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/screens/settings_screen.dart';
import 'package:provider/provider.dart';

class ActivationCodeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsScreenModel>(context);
    return TextFormField(
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(64).minLength(8).build(),
      onChanged: (value) => model.codeContent = value,
      decoration: InputDecoration(
        labelText: 'Activation code',
        prefixIcon: Icon(Icons.shopping_basket),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
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
