import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  DashboardViewmodel() {
    init();
  }

  init() async {
    await getBoudry();
  }

  var _apiService = ApiService.init();
   final _sharedPreference = locator<SharedPreferences>();


  bool? _isStaffLoggedIn;



  Uint8List get image => const Base64Decoder().convert(_sharedPreference.getString('logo') ?? '');
  List<Annoncement> get annoncement =>  [];
  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;
  String get userName => _sharedPreference.getString('name') ?? 'college';
  String get empId => _sharedPreference.getString('id') ?? 'empid';

  String get token => _sharedPreference.getString('token') ?? '';

  setLogIn(bool isStaffLoggedIn) async {
    _apiService = ApiService.init();
    await getBoudry();

    print(token);
    _isStaffLoggedIn = isStaffLoggedIn;
    notifyListeners();
  }

  Future<void> getBoudry() async {
    final res = await _apiService.getBoundries();
    log(res.boundry.toString());
  }

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }
}
