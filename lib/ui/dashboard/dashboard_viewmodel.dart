import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  DashboardViewmodel(this._loginResponse) {
    init();
  }

  init() async {
    _sharedPreference = await SharedPreferences.getInstance();
    await getBoudry();
  }

  var _apiService = ApiService.init();

  final LoginResponse? _loginResponse;
  bool? _isStaffLoggedIn;
  late SharedPreferences _sharedPreference;

  LoginResponse get loginResponse => _loginResponse ?? LoginResponse();

  Uint8List get image => const Base64Decoder().convert(_loginResponse?.logo ?? '');
  List<Annoncement> get annoncement => _loginResponse?.annoncement ?? [];
  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;
  String get userName => _loginResponse?.name ?? 'college';
  String get empId => _loginResponse?.employeeId ?? 'empid';

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
}
