import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    return Scaffold(
      body: Center(
          child: Container(child: Text(json.encode(global.activeAccount)))),
    );
  }
}
