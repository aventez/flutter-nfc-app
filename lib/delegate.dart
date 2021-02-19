import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nfc_mobile/home.dart';
import 'package:nfc_mobile/models/auth.dart';
import 'package:provider/provider.dart';

class AppDelegate extends StatelessWidget {
  Widget buildChild(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade200,
      ),
    );

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.grey.shade200,
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
