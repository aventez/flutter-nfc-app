import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/settings_screen.dart';
import 'package:provider/provider.dart';

class OldPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<SettingsScreenModel>(context);
    return TextFormField(
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(64).minLength(8).build(),
      onChanged: (value) => model.oldPasswordFieldContent = value,
      decoration: InputDecoration(
        labelText: 'Old password',
        prefixIcon: Icon(Icons.lock_outline),
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
