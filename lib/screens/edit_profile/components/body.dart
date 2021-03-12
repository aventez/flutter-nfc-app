import 'package:flutter/material.dart';
import 'package:idrop/screens/edit_profile/components/avatar_field.dart';
import 'package:idrop/screens/edit_profile/components/form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(size.width * 0.1),
      children: [
        SizedBox(height: size.height * 0.12),
        Center(
          child: Image.asset(
            'assets/edit_profile_artwork.png',
            width: size.width * 0.5,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          'Edit your profile',
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: size.height * 0.04),
        AvatarField(),
        SizedBox(height: size.height * 0.04),
        EditProfileForm(),
      ],
    );
  }
}
