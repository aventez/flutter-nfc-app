import 'package:flutter/material.dart';
import 'package:IDrop/screens/fulfillment/components/form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(size.width * 0.1),
      children: [
        SizedBox(height: size.height * 0.12),
        Center(
          child: Image.asset(
            'assets/fulfillment_artwork.png',
            width: size.width * 0.5,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          'Just a few seconds...',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.01),
        Text(
          'Hey! One more step to create your IDrop profile, tell us more about you. Let\'s go!',
        ),
        SizedBox(height: size.height * 0.04),
        FulfillmentForm(),
      ],
    );
  }
}
