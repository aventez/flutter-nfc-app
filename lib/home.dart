import 'package:flutter/material.dart';
import 'package:nfc_mobile/common/providers.dart';
import 'package:nfc_mobile/screens/login/login.dart';
import 'package:nfc_mobile/screens/nfc/nfc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'models/auth.dart';
import 'models/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  ProviderConfig _providerConfig = ProviderConfig.getInstance();

  _buildScreens() {
    return [
      _providerConfig.getProfileScreen(),
      NfcScreen(),
      _providerConfig.getSettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavigationItems(Color primary) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColor: primary.withOpacity(0.75),
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.nfc_outlined),
        title: "NFC Scan",
        activeColor: primary.withOpacity(0.75),
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_outlined),
        title: "Settings",
        activeColor: primary.withOpacity(0.75),
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final theme = Provider.of<ThemeModel>(context);
    final palette = theme.logic.getPalette();

    if (auth.activeAccount == null) {
      //return LoginScreen();
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _buildNavigationItems(palette.primaryColor),
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        colorBehindNavBar: palette.primaryColor,
      ),
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style12,
    );
  }
}
