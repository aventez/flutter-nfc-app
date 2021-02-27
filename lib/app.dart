import 'package:idrop/home.dart';
import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  Widget buildChild(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade50,
        primaryColor: Colors.grey.shade200,
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
