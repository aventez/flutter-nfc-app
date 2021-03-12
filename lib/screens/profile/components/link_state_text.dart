import 'package:flutter/material.dart';

class ProfileLinkStateText extends StatelessWidget {
  final String name;

  ProfileLinkStateText({
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    if (name != null) {
      return Text(
        '$name',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
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
