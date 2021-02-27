import 'package:idrop/app.dart';
import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final globalModel = GlobalModel();
  final themeModel = ThemeModel();

  await Future.wait([
    globalModel.init(),
    themeModel.init(),
  ]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => themeModel),
      ChangeNotifierProvider(create: (context) => globalModel),
    ],
    child: App(),
  ));
}
