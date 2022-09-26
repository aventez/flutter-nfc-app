import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:IDrop/models/common/global.dart';
import 'package:IDrop/models/screens/profile_screen.dart';
import 'package:IDrop/utils/alerts.dart';
import 'package:provider/provider.dart';

class WebsiteLinkIcons extends StatelessWidget {
  final String id;

  WebsiteLinkIcons({
    @required this.id,
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
            model.showCreateWebsiteModal(id: id);
          },
        ),
        IconButton(
          color: Colors.black.withOpacity(0.45),
          icon: Icon(Icons.delete),
          onPressed: () async {
            final result = await showConfirmationAlert(
              context,
              'Unlink action will be unrestorable',
            );

            if (result == true) {
              await model.deleteWebsite(this.id);
            }
          },
        ),
      ],
    );
  }
}
