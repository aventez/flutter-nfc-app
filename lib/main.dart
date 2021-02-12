import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'delegate.dart';
import 'models/auth.dart';

void main() async {
  final authModel = AuthModel();

  await Future.wait([
    authModel.init(),
  ]);

  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => authModel)],
    child: AppDelegate(),
  ));
}
