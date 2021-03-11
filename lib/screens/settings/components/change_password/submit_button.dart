import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/models/screens/settings_screen.dart';
import 'package:provider/provider.dart';

class ChangePasswordSubmitButton extends StatelessWidget {
  const ChangePasswordSubmitButton({
    @required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final model = Provider.of<SettingsScreenModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.getPalette();
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState.validate()) {
          model.submitChangePasswordForm();
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(size.width),
          ),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(size.width / 2.6, size.height * 0.06),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          palette.primaryColor,
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(fontSize: 17.0),
        ),
        elevation: MaterialStateProperty.all<double>(0),
      ),
      child: Text('Change'.toUpperCase()),
    );
  }
}
