import 'package:flutter/cupertino.dart';

class BaseScaffold extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget action;
  final PreferredSizeWidget bottom;

  BaseScaffold({
    @required this.title,
    @required this.body,
    this.action,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(child: body),
      navigationBar: CupertinoNavigationBar(
        middle: title,
        trailing: action,
      ),
    );
  }
}
