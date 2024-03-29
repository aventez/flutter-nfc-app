import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class NameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EditProfileScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().minLength(2).maxLength(40).build(),
      onChanged: (value) => model.nameFieldContent = value ?? '',
      initialValue: global.profileData.name,
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'Your name',
        prefixIcon: Icon(Icons.assignment_ind),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
