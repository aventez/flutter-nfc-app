import 'package:flutter/material.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/utils/scaffolds/base_scaffold.dart';
import 'package:idrop/utils/widgets/app_header.dart';
import 'package:provider/provider.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;

  CommonScaffold({
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppHeader(),
          Expanded(child: this.body),
        ],
      ),
    );
  }
}
