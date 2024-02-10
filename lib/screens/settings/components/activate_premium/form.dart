import 'package:IDrop/screens/settings/components/activate_premium/submit_button.dart';
import 'package:flutter/material.dart';

import 'code.dart';

class ActivatePremiumForm extends StatefulWidget {
  @override
  ActivatePremiumFormState createState() => ActivatePremiumFormState();
}

class ActivatePremiumFormState extends State<ActivatePremiumForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          ActivationCodeField(),
          SizedBox(height: size.height * 0.03),
          ActivationPremiumSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
