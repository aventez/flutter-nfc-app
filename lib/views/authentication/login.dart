import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_mobile/utils/scaffolds/base.dart';
import 'package:nfc_mobile/utils/widgets/extendedTextField.dart';

class LoginView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  Widget _headerText() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: RichText(
        text: TextSpan(
            style: new TextStyle(
              fontSize: 19.0,
              color: CupertinoColors.black,
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              TextSpan(text: 'Sign in to '),
              TextSpan(
                text: 'AppName',
                style: TextStyle(color: CupertinoColors.systemOrange),
              )
            ]),
      ),
    );
  }

  Widget _emailField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: ExtendedTextField(
        placeholder: 'E-mail',
        onChanged: (text) => {},
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: ExtendedTextField(
        action: ActionPayload(
          icon: CupertinoIcons.eye,
          onTap: () => {},
        ),
        placeholder: 'Password',
        obscure: true,
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [_headerText()],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          _emailField(),
          _passwordField(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(title: Text('Sign-in'), body: _buildForm(context));
  }
}
