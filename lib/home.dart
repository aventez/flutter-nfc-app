import 'package:idrop/models/common/global.dart';
import 'package:idrop/models/common/theme.dart';
import 'package:idrop/screens/login/login.dart';
import 'package:idrop/utils/interfaces/palette.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  _buildScreens(BuildContext context) {
    final global = Provider.of<GlobalModel>(context);
    return [
      global.providerConfig.getProfileScreen(),
      global.providerConfig.getNfcScreen(),
      global.providerConfig.getSettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavigationItems(Palette palette) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "Profile",
        activeColor: palette.secondaryColor,
        activeColorAlternate: palette.primaryColor,
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.nfc_outlined),
        title: "NFC Scan",
        activeColor: palette.secondaryColor,
        activeColorAlternate: palette.primaryColor,
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings_outlined),
        title: "Settings",
        activeColor: palette.secondaryColor,
        activeColorAlternate: palette.primaryColor,
        inactiveColor: Colors.grey.withOpacity(0.35),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeModel>(context);
    final global = Provider.of<GlobalModel>(context);
    final palette = theme.getPalette();

    if (global.activeAccount == null) {
      return LoginScreen();
    }

    return PersistentTabView(
      context,
      controller: global.controller,
      screens: _buildScreens(context),
      items: _buildNavigationItems(palette),
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
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
      navBarStyle: NavBarStyle.style7,
    );
  }
}
