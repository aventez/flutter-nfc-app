import 'package:idrop/models/screens/edit_profile_screen.dart';
import 'package:idrop/models/screens/fulfillment_screen.dart';
import 'package:idrop/models/screens/login_screen.dart';
import 'package:idrop/models/screens/nfc_screen.dart';
import 'package:idrop/models/screens/profile_screen.dart';
import 'package:idrop/models/screens/register_screen.dart';
import 'package:idrop/models/screens/settings_screen.dart';
import 'package:idrop/screens/edit_profile/edit_profile.dart';
import 'package:idrop/screens/fulfillment/fulfillment.dart';
import 'package:idrop/screens/login/login.dart';
import 'package:idrop/screens/nfc/nfc.dart';
import 'package:idrop/screens/profile/profile.dart';
import 'package:idrop/screens/register/register.dart';
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
      create: (context) => ProfileScreenModel(context),
      child: ProfileScreen(),
    );
  }

  ChangeNotifierProvider<NfcScreenModel> getNfcScreen() {
    return ChangeNotifierProvider<NfcScreenModel>(
      create: (context) => NfcScreenModel(context),
      child: NfcScreen(),
    );
  }

  ChangeNotifierProvider<SettingsScreenModel> getSettingsScreen() {
    return ChangeNotifierProvider<SettingsScreenModel>(
      create: (context) => SettingsScreenModel(context),
      child: SettingsScreen(),
    );
  }

  ChangeNotifierProvider<LoginScreenModel> getLoginScreen() {
    return ChangeNotifierProvider<LoginScreenModel>(
      create: (context) => LoginScreenModel(context),
      child: LoginScreen(),
    );
  }

  ChangeNotifierProvider<RegisterScreenModel> getRegisterScreen() {
    return ChangeNotifierProvider<RegisterScreenModel>(
      create: (context) => RegisterScreenModel(),
      child: RegisterScreen(),
    );
  }

  ChangeNotifierProvider<FulfillmentScreenModel> getFulfillmentScreen() {
    return ChangeNotifierProvider<FulfillmentScreenModel>(
      create: (context) => FulfillmentScreenModel(context),
      child: FulfillmentScreen(),
    );
  }

  ChangeNotifierProvider<EditProfileScreenModel> getEditProfileScreen() {
    return ChangeNotifierProvider<EditProfileScreenModel>(
      create: (context) => EditProfileScreenModel(context),
      child: EditProfileScreen(),
    );
  }
}
