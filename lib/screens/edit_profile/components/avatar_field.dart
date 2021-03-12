import 'package:flutter/material.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/screens/edit_profile_screen.dart';
import 'package:idrop/utils/widgets/profile_avatar.dart';
import 'package:provider/provider.dart';

class AvatarField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<EditProfileScreenModel>(context);
    final global = Provider.of<GlobalModel>(context);

    return Column(
      children: [
        GestureDetector(
          onTap: () => model.handleChangeAvatar(),
          child: ProfileAvatar(
            width: size.height * 0.15,
            height: size.height * 0.15,
            avatarUrl: global.activeAccount.avatarURL,
            borderSize: 0,
          ),
        ),
        global.activeAccount.avatarURL != null
            ? TextButton(
                onPressed: () => model.handleDeleteAvatar(),
                child: Text('Delete avatar'),
              )
            : Container(),
      ],
    );
  }
}
