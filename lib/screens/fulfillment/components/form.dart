import 'package:flutter/material.dart';
import 'package:idrop/screens/fulfillment/components/job_field.dart';
import 'package:idrop/screens/fulfillment/components/name_field.dart';
import 'package:idrop/screens/fulfillment/components/submit_button.dart';

class FulfillmentForm extends StatefulWidget {
  @override
  FulfillmentFormState createState() => FulfillmentFormState();
}

class FulfillmentFormState extends State<FulfillmentForm> {
  final formKey = GlobalKey<FormState>();

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
          FulfillmentSubmitButton(formKey: formKey),
        ],
      ),
    );
  }
}
