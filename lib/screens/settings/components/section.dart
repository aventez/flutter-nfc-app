import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

class Section extends StatelessWidget {
  final Widget title;
  final Widget body;

  Section({
    @required this.title,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 25.0),
          width: size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: palette.secondaryColor),
            ),
          ),
          child: this.title,
        ),
        Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            width: size.width,
            child: this.body,
          ),
        ),
      ],
    );
  }
}
