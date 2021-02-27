import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
      ),
      body: this.body,
      extendBodyBehindAppBar: true,
    );
  }
}
