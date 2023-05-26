import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  DashboardViewmodel(this._loginResponse);

  final LoginResponse? _loginResponse;
  bool? _isStaffLoggedIn;

   LoginResponse get loginResponse => _loginResponse ?? LoginResponse();

  Uint8List get image => const Base64Decoder().convert(_loginResponse?.logo ?? '');
  List<Annoncement> get annoncement => _loginResponse?.annoncement ?? [];
  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;
  String get userName => _loginResponse?.name ?? 'User';

  setLogIn(bool isStaffLoggedIn) {
    _isStaffLoggedIn = isStaffLoggedIn;
    notifyListeners();
  }
}
