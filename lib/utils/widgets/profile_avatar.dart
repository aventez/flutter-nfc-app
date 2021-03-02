import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double width;
  final double height;
  final double borderSize;

  const ProfileAvatar({
    @required this.width,
    @required this.height,
    this.borderSize = 7,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: this.borderSize,
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/avatar-placeholder.png"),
        ),
      ),
    );
  }
}
