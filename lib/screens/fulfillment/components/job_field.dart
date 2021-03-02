import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:idrop/models/screens/fulfillment_screen.dart';
import 'package:provider/provider.dart';

class JobField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<FulfillmentScreenModel>(context);
    return Column(
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: ValidationBuilder().maxLength(30).build(),
          onChanged: (value) => model.jobFieldContent = value ?? '',
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
        ),
      ],
    );
  }
}
