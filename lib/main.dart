import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';
import 'package:provider/provider.dart';

import 'delegate.dart';
import 'models/auth.dart';

void main() async {
  final authModel = AuthModel();
  final themeModel = ThemeModel();

  await Future.wait([
    authModel.init(),
    themeModel.init(),
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => authModel),
      ChangeNotifierProvider(create: (context) => themeModel),
    ],
    child: AppDelegate(),
  ));
}
