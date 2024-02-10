import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/edit_profile_screen.dart';
import 'package:IDrop/screens/edit_profile/components/job_field.dart';
import 'package:IDrop/screens/edit_profile/components/name_field.dart';
import 'package:IDrop/screens/edit_profile/components/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:after_init/after_init.dart';

class EditProfileForm extends StatefulWidget {
  @override
  EditProfileFormState createState() => EditProfileFormState();
}

class EditProfileFormState extends State<EditProfileForm>
    with AfterInitMixin<EditProfileForm> {
  final formKey = GlobalKey<FormState>();

  @override
  void didInitState() {
    final global = Provider.of<GlobalModel>(context);
    final model = Provider.of<EditProfileScreenModel>(context);
    model.nameFieldContent = global.profileData.name;
    model.jobFieldContent = global.profileData.job;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameField(),
          SizedBox(height: size.height * 0.02),
          JobField(),
          SizedBox(height: size.height * 0.04),
          EditProfileSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
