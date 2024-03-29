import 'package:flutter/material.dart';
import 'package:IDrop/screens/edit_profile/components/avatar_field.dart';
import 'package:IDrop/screens/edit_profile/components/form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(size.width * 0.1),
      children: [
        SizedBox(height: size.height * 0.08),
        Center(
          child: Image.asset(
            'assets/edit_profile_artwork.png',
            width: size.height * 0.2,
          ),
        ),
        SizedBox(height: size.height * 0.04),
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
