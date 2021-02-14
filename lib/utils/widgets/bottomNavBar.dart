import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/auth.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.navigationItems,
    @required this.auth,
  }) : super(key: key);

  final List<BottomNavigationBarItem> navigationItems;
  final AuthModel auth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10,
              offset: Offset(0, -5)),
        ],
      ),
      child: BottomNavigationBar(
        items: navigationItems,
        currentIndex: auth.activeTab,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        onTap: (int index) => auth.setActiveTab(index),
      ),
    );
  }
}
