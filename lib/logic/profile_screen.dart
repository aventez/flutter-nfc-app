import 'package:flutter/material.dart';
import 'package:nfc_mobile/models/profile_screen.dart';

class ProfileScreenLogic {
  final ProfileScreenModel _model;

  ProfileScreenLogic(this._model);

  void onTapProfileEdit() {
    // TODO: Redirect to profile editor
    debugPrint('tap registered');
    //_model.refresh();
  }
}
