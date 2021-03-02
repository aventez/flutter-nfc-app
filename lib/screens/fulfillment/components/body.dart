import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/screens/fulfillment/components/form.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final model = Provider.of<LoginScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);
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
          'Hey! Only one simple step separates you from full access to the application. Just you have to tell us a bit about you. Let\'s go!',
        ),
        SizedBox(height: size.height * 0.04),
        FulfillmentForm(),
      ],
    );
  }
}
