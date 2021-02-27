import 'package:idrop/utils/interfaces/palette.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  ThemeModel();

  /* Variables section */
  int themeId;
  SharedPreferences sharedPreferences;
  /* Variables section end */

  /* Logic section */
  void refresh() => notifyListeners();

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();

    this.themeId = sharedPreferences.getInt('theme:themeId');

    refresh();
  }

  void changeTheme(int index) {
    sharedPreferences.setInt('theme:themeId', index);

    this.themeId = index;
    this.refresh();
  }

  Palette getPalette() {
    switch (this.themeId) {
      case 2:
        return Palette(
          primaryColor: Color(0xFF263238),
          secondaryColor: Color(0xFF6e777c),
          textColor: Colors.black,
          textLightColor: Colors.grey,
        );
      case 3:
        return Palette(
          primaryColor: Color(0xFF0D47A1),
          secondaryColor: Color(0xFF7695C4),
          textColor: Colors.black,
          textLightColor: Colors.grey,
        );
      case 4:
        return Palette(
          primaryColor: Color(0xFFFF8F00),
          secondaryColor: Color(0xFFE7BE8A),
          textColor: Colors.black,
          textLightColor: Colors.grey,
        );
      case 5:
        return Palette(
          primaryColor: Color(0xFF33691e),
          secondaryColor: Color(0xFF8BCB71),
          textColor: Colors.black,
          textLightColor: Colors.grey,
        );
      default:
        return Palette(
          primaryColor: Color(0xFFE96137),
          secondaryColor: Color(0xFFFFE0B2),
          textColor: Colors.black,
          textLightColor: Colors.grey,
        );
    }
  }
  /* Logic section end */
}
