import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nfc_mobile/utils/widgets/bottomNavBar.dart';
import 'models/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<NavigatorState> profileTab = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> nfcTab = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> settingsTab = GlobalKey<NavigatorState>();

  _buildScreen(int index) {
    switch (index) {
      case 0:
        return Scaffold(body: Text('Profile tab')); // TODO: Profile tab
      case 1:
        return Scaffold(body: Text('Scan tab')); // TODO: NFC Scan tab
      case 2:
        return Scaffold(body: Text('')); // TODO: Settings tab
    }
  }

  GlobalKey<NavigatorState> getNavigatorKey(int index) {
    switch (index) {
      case 0:
        return profileTab;
      case 1:
        return nfcTab;
      case 2:
        return settingsTab;
      default:
        return profileTab;
    }
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: 'Profile',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.nfc_outlined),
        activeIcon: Icon(Icons.nfc),
        label: 'NFC Scan',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings_outlined),
        activeIcon: Icon(Icons.settings),
        label: 'Settings',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);

    if (auth.activeAccount == null) {
      //return LoginView();
    }

    final navigationItems = _buildNavigationItems();

    return Scaffold(
      appBar: CustomAppBar(),
      body: IndexedStack(
        index: auth.activeTab,
        children: [
          for (var i = 0; i < navigationItems.length; i++) _buildScreen(i)
        ],
      ),
      bottomNavigationBar:
          BottomNavBar(navigationItems: navigationItems, auth: auth),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar() : preferredSize = Size.fromHeight(145.0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10.0,
              offset: Offset(-2, 3),
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(top: 25.0, left: 35.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: size.height * 0.09,
                width: size.height * 0.09,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                  /*image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Test()
                      ),*/
                ),
              ),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filip',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text('Since 22.11.2020',
                      style: TextStyle(
                        fontSize: 10.0,
                      )),
                ],
              ),
              /*Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Filip',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text('F')
                ],
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
