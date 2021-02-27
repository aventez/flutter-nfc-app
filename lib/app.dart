import 'package:idrop/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  Widget buildChild(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.grey.shade200),
    );

    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        primaryColor: Colors.grey.shade200,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    return Container(key: global.rootKey, child: buildChild(context));
  }
}
