import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Color(0xFFE96137),
          size: 50.0,
        ),
      ),
    );
  }
}
