import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/theme.dart';

/*

const kPrimaryColor = Color(0xFFE96137); // GREEN: Color(0xFF7AA052);
const kSecondaryColor = Color(0xFFFFE0B2);
const kContrastColor = Colors.black;
const kTextColor = Colors.black;
const kTextLightColor = Colors.grey;


*/

class Palette {
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Color textLightColor;

  const Palette({
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.textColor,
    @required this.textLightColor,
  });
}

class ThemeLogic {
  final ThemeModel _model;

  ThemeLogic(this._model);

  void changeTheme(int index) {
    _model.themeId = index;
    _model.refresh();
  }

  Palette getPalette() {
    switch (_model.themeId) {
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
}
