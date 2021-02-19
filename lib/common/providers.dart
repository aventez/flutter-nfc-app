import 'package:nfc_mobile/models/profile_screen.dart';
import 'package:nfc_mobile/models/settings_screen.dart';
import 'package:nfc_mobile/screens/profile/profile.dart';
import 'package:nfc_mobile/screens/settings/settings.dart';
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

  ChangeNotifierProvider<SettingsScreenModel> getSettingsScreen() {
    return ChangeNotifierProvider<SettingsScreenModel>(
      create: (context) => SettingsScreenModel(),
      child: SettingsScreen(),
    );
  }
}
