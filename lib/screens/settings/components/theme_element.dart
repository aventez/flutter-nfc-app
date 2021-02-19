import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nfc_mobile/models/settings_screen.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

class ThemeElement extends StatelessWidget {
  final int id;
  final Color color;
  final String name;

  const ThemeElement({
    @required this.id,
    @required this.color,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: palette.primaryColor,
      title: Row(
        children: [
          Container(
            width: size.width * 0.08,
            height: size.width * 0.08,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
          ),
          SizedBox(width: size.width * 0.04),
          Text(this.name),
        ],
      ),
      value: this.id,
      groupValue: theme.themeId,
      onChanged: (value) {
        theme.logic.changeTheme(value);
      },
    );
  }
}
