import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:location/location.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/staff_login_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  DashboardViewmodel() {
    init();
    // autologOut();
  }

  init() async {
    // await getBoudry();
    getCurrentLocation();
    wifiIp();
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();

  final _sharedPreference = locator<SharedPreferences>();

  final _userAuthenticationService = locator<UserAuthenticationService>();

  LoginResponse get loginResponse => _userAuthenticationService.loginResponse;

  bool? _isStaffLoggedIn;

  String? _lat;
  String? _long;
  int? _insId;
  String? wifiGatewayIP;
  String? getWifiIP;

  Uint8List get image =>
      const Base64Decoder().convert(_sharedPreference.getString('logo') ?? '');
  // List<Annoncement> get annoncement => [];
  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;
  String get userName => _sharedPreference.getString('name') ?? '';
  String get empId => _sharedPreference.getString('id') ?? '';
  int? get insId => _insId;

  String get token => _sharedPreference.getString('token') ?? '';
  List<Annoncement> get annoncement {
    var json1 = {
      "annoncement":
          json.decode(_sharedPreference.getString('annoncement') ?? "[{}]")
    };
    return LoginResponse.fromJson(json1).annoncement ?? [];
  }

  // LocationData? get locationData => _locationData;

  // String? get lat => locationData?.latitude.toString();
  // String? get long => locationData?.longitude.toString();
  String get gatewayIp => wifiGatewayIP.toString();
  String get ipadd => getWifiIP.toString();

  Location get location => Location();

  getCurrentLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  wifiIp() async {
    NetworkInfo networkInfo = NetworkInfo();

    wifiGatewayIP = await networkInfo.getWifiGatewayIP();
    getWifiIP = await networkInfo.getWifiIP();

    log('gatewayIp: ' + (wifiGatewayIP.toString()));
    log('ipadd: ' + (ipadd.toString()));
  }

  Future<void> staffLogin() async {
    final _locationData = await location.getLocation();
    _lat = _locationData.latitude?.toString();
    _long = _locationData.longitude?.toString();
    final staffLoginRequest = StaffLoginRequest(
        atime: DateTime.now(),
        lat: _long,
        long: _lat,
        wifi: ipadd,
        employeeId: empId,
        description: 'test');
    final response =
        await runBusyFuture(_apiService.staffAttendance(staffLoginRequest))
            .catchError((err) {
      print(err);
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          description: err?.toString() ?? 'Something went wrong');
    });
    if (!hasError) {
      _isStaffLoggedIn = response == "True";
      if (!(_isStaffLoggedIn ?? false)) {
        showErrDialog('You are not inside the campus');
      }
    } else {
      response == HttpStatus.notFound;
      showErrDialog('File is Not Found');
    }
  }

  Future<void> autologOut() async {
    log('autologOut 1');
    _userAuthenticationService.autoLogout();
  }

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  Future<void> getBoudry() async {
    final res = await _apiService.getBoundries();
    _insId = res.insId;
    _sharedPreference.setInt('insId', res.insId ?? 0);
    log(res.boundry.toString());
  }

  Future<void> section() async {
    showErrDialog(
        'Please Login Your Attendance and Take the Student Attendance');
  }

  Future<void> section1() async {
    showErrDialog(
        'Please Login Your Attendance and View the Student Attendance');
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Message", description: message);
  }
}
