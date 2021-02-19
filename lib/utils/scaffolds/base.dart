import 'package:flutter/material.dart';
import 'package:nfc_mobile/utils/widgets/header.dart';
import 'package:nfc_mobile/utils/widgets/logo.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;

  BaseScaffold({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 15,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                child: this.body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
