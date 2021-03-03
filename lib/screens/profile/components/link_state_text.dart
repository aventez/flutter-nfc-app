import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:provider/provider.dart';

class ProfileLinkStateText extends StatelessWidget {
  final String name;

  ProfileLinkStateText({
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();
    final size = MediaQuery.of(context).size;

    if (name != null) {
      return Text(
        '$name',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.green,
        ),
      );
    } else {
      return Text(
        'Unlinked',
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
        ),
      );
    }
  }
}
