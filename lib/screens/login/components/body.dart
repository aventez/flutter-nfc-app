import 'package:flutter/material.dart';
import 'package:nfc_mobile/screens/login/components/form.dart';
import 'package:nfc_mobile/screens/login/components/header.dart';
import 'package:nfc_mobile/utils/widgets/logo.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(width: size.width * 0.35),
              SizedBox(height: size.height * 0.07),
              SignInHeader(),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Column(
                  children: [
                    LoginForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
