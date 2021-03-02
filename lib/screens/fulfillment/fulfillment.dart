import 'package:flutter/material.dart';
import 'package:idrop/screens/fulfillment/components/body.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';

class FulfillmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: Color(0xFFE96137)),
        child: Body(),
      ),
    );
  }
}
