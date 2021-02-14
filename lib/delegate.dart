import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'models/auth.dart';

class AppDelegate extends StatelessWidget {
  Widget buildChild(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.deepOrange,
      ),
      home: Home(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    return Container(key: auth.rootKey, child: buildChild(context));
  }
}
