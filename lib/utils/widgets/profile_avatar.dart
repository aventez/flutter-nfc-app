import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double radius;
  final double borderSize;
  final String avatarUrl;

  const ProfileAvatar({
    @required this.radius,
    this.borderSize = 7,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      child: CircleAvatar(
        radius: this.radius - this.borderSize,
        backgroundImage: this.avatarUrl != null
            ? NetworkImage(this.avatarUrl)
            : AssetImage("assets/avatar-placeholder.png"),
      ),
      backgroundColor: Colors.white,
    );
  }
}
