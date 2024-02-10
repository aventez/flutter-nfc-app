import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/profile_screen.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:provider/provider.dart';

class ProfileLinksIcons extends StatelessWidget {
  final String name;
  final String brand;
  final String message;

  ProfileLinksIcons({
    @required this.name,
    @required this.brand,
    @required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    final model = Provider.of<ProfileScreenModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          color: Colors.black.withOpacity(0.45),
          icon: Icon(Icons.edit),
          onPressed: () async {
            final result = await showTextInputDialog(
              context: context,
              textFields: [
                DialogTextField(
                  initialText: name,
                  validator:
                      ValidationBuilder().minLength(2).maxLength(128).build(),
                ),
              ],
              title: 'Linking account',
              message: this.message,
              okLabel: 'Save',
              cancelLabel: 'Cancel',
              useRootNavigator: true,
              style: AdaptiveStyle.adaptive,
              fullyCapitalizedForMaterial: true,
            );

            final text = result == null ? null : result[0];
            if (text != null) {
              model.onUserEditLink(brand, result[0]);
            }
          },
        ),
        name != null
            ? IconButton(
                color: Colors.black.withOpacity(0.45),
                icon: Icon(Icons.delete),
                onPressed: () async {
                  final result = await showConfirmationAlert(
                    context,
                    'Unlink action will be unrestorable',
                  );

                  if (result == true) {
                    await global.apiService.updateProfileSettings(
                        global.activeProfileId, {brand: ''});
                    global.refreshUser();
                  }
                },
              )
            : Container(),
      ],
    );
  }
}
