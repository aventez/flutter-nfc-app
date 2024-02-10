import 'package:flutter/material.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/edit_profile_screen.dart';
import 'package:IDrop/utils/widgets/profile_avatar.dart';
import 'package:provider/provider.dart';

class AvatarField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<EditProfileScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);

    return Column(
      children: [
        ProfileAvatar(
          radius: size.height * 0.075,
          avatarUrl: global.profileData.avatarURL,
          borderSize: 0,
        ),
        global.profileData.avatarURL != null
            ? TextButton(
                onPressed: () => model.handleDeleteAvatar(),
                child: Text('Delete profile picture'),
              )
            : TextButton(
                onPressed: () => model.handleChangeAvatar(),
                child: Text('Click here to edit picture'),
              ),
      ],
    );
  }
}
