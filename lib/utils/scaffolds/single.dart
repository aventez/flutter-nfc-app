import 'package:flutter/cupertino.dart';
import 'package:nfc_mobile/utils/scaffolds/base.dart';

class SingleScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget action;

  SingleScaffold({
    @required this.title,
    @required this.body,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: title,
      body: CupertinoScrollbar(child: SingleChildScrollView(child: body)),
      action: action,
    );
  }
}
