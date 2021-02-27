import 'package:idrop/models/screens/nfc_screen.dart';
import 'package:idrop/models/screens/profile_screen.dart';
import 'package:idrop/models/screens/settings_screen.dart';
import 'package:idrop/screens/nfc/nfc.dart';
import 'package:idrop/screens/profile/profile.dart';
import 'package:idrop/screens/settings/settings.dart';
import 'package:provider/provider.dart';

class ProviderConfig {
  /* Singleton pattern configuration */
  static ProviderConfig _instance;

  static ProviderConfig getInstance() {
    if (_instance == null) {
      _instance = ProviderConfig._init();
    }
    return _instance;
  }

  ProviderConfig._init();

  /* Providers */
  ChangeNotifierProvider<ProfileScreenModel> getProfileScreen() {
    return ChangeNotifierProvider<ProfileScreenModel>(
      create: (context) => ProfileScreenModel(),
      child: ProfileScreen(),
    );
  }

  ChangeNotifierProvider<NfcScreenModel> getNfcScreen() {
    return ChangeNotifierProvider<NfcScreenModel>(
      create: (context) => NfcScreenModel(),
      child: NfcScreen(),
    );
  }

  ChangeNotifierProvider<SettingsScreenModel> getSettingsScreen() {
    return ChangeNotifierProvider<SettingsScreenModel>(
      create: (context) => SettingsScreenModel(),
      child: SettingsScreen(),
    );
  }
}