import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class JobField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EditProfileScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder(optional: true).maxLength(30).build(),
      onChanged: (value) => model.jobFieldContent = value ?? '',
      initialValue: global.profileData.job ?? '',
      decoration: InputDecoration(
        enabled: !model.requestInQueue,
        labelText: 'Job position (optional)',
        prefixIcon: Icon(Icons.work),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
