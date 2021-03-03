import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/screens/edit_profile_screen.dart';
import 'package:provider/provider.dart';

class JobField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<EditProfileScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: ValidationBuilder().maxLength(30).build(),
      onChanged: (value) => model.jobFieldContent = value ?? '',
      initialValue: global.activeAccount.job ?? '',
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
