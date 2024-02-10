import 'package:IDrop/models/screens/edit_profile_screen.dart';
import 'package:IDrop/models/screens/fulfillment_screen.dart';
import 'package:IDrop/models/screens/loading_screen.dart';
import 'package:IDrop/models/screens/login_screen.dart';
import 'package:IDrop/models/screens/more_screen.dart';
import 'package:IDrop/models/screens/nfc_screen.dart';
import 'package:IDrop/models/screens/offline_screen.dart';
import 'package:IDrop/models/screens/profile_screen.dart';
import 'package:IDrop/models/screens/register_screen.dart';
import 'package:IDrop/models/screens/settings_screen.dart';
import 'package:IDrop/models/screens/switch_profile_screen.dart';
import 'package:IDrop/screens/edit_profile/edit_profile.dart';
import 'package:IDrop/screens/fulfillment/fulfillment.dart';
import 'package:IDrop/screens/loading/loading.dart';
import 'package:IDrop/screens/login/login.dart';
import 'package:IDrop/screens/more/more.dart';
import 'package:IDrop/screens/nfc/nfc.dart';
import 'package:IDrop/screens/offline/offline.dart';
import 'package:IDrop/screens/profile/profile.dart';
import 'package:IDrop/screens/register/register.dart';
import 'package:IDrop/screens/settings/settings.dart';
import 'package:IDrop/screens/switch_profile/edit_profile.dart';
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

  ChangeNotifierProvider<MoreScreenModel> getMoreScreen() {
    return ChangeNotifierProvider<MoreScreenModel>(
      create: (context) => MoreScreenModel(context),
      child: MoreScreen(),
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

  ChangeNotifierProvider<SwitchProfileScreenModel> getSwitchProfileScreen() {
    return ChangeNotifierProvider<SwitchProfileScreenModel>(
      create: (context) => SwitchProfileScreenModel(context),
      child: SwitchProfileScreen(),
    );
  }

  ChangeNotifierProvider<LoadingScreenModel> getLoadingScreen() {
    return ChangeNotifierProvider<LoadingScreenModel>(
      create: (context) => LoadingScreenModel(context),
      child: LoadingScreen(),
    );
  }

  ChangeNotifierProvider<OfflineScreenModel> getOfflineScreen() {
    return ChangeNotifierProvider<OfflineScreenModel>(
      create: (context) => OfflineScreenModel(context),
      child: OfflineScreen(),
    );
  }
}
