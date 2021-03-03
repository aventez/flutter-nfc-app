import 'package:flutter/material.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';
import 'package:idrop/utils/widgets/app_header.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;
  final List<Widget> actions;

  CommonScaffold({
    @required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          Expanded(child: this.body),
        ],
      ),
      actions: this.actions,
    );
  }
}
