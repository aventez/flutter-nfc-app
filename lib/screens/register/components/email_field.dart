import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/register_screen.dart';
import 'package:provider/provider.dart';

class RegisterEmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<RegisterScreenModel>(context);
    return TextFormField(
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().email().maxLength(32).build(),
      onChanged: (value) => model.emailFieldContent = value,
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'E-mail address',
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
