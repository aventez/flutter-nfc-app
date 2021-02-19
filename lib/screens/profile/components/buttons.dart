import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:nfc_mobile/utils/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundedButton(
            icon: Icon(Icons.edit),
            content: 'Edit',
            backgroundColor: Colors.grey.shade300,
            textColor: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            onPressed: () => {},
          ),
          SizedBox(width: 50.0),
          RoundedButton(
            icon: Icon(Icons.add),
            content: 'Add next link',
            backgroundColor: palette.secondaryColor,
            textColor: palette.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
