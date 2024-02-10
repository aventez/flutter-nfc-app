import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final List<Widget> actions;

  BaseScaffold({
    @required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: actions,
      ),
      body: this.body,
      extendBodyBehindAppBar: true,
    );
  }
}
