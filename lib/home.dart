import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> tab1 = GlobalKey<NavigatorState>();

  _buildScreen(int index) {
    final auth = Provider.of<AuthModel>(context);
    return CupertinoPageScaffold(child: Text('e'));
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    final search = BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      activeIcon: Icon(Icons.favorite_outline),
      label: 'test1',
    );

    final test2 = BottomNavigationBarItem(
      icon: Icon(Icons.ac_unit),
      activeIcon: Icon(Icons.ac_unit_outlined),
      label: 'test2',
    );

    return [search, test2];
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);

    //if (auth.activeAccount == null)

    return WillPopScope(
        child: CupertinoTabScaffold(
          tabBuilder: (context, index) {
            return CupertinoTabView(
              navigatorKey: tab1, //getNavigatorKey(index),
              builder: (context) {
                return _buildScreen(index);
              },
            );
          },
          tabBar: CupertinoTabBar(
            items: _buildNavigationItems(),
            currentIndex: 1,
            onTap: (index) {},
          ),
        ),
        onWillPop: () async {
          return !await tab1.currentState?.maybePop();
        });
  }
}
