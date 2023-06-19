import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:location/location.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/locator.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  DashboardViewmodel() {
    getCurrentLocation();
    wifiIp();
  }

  final _dialogService = locator<DialogService>();

  final _sharedPreference = locator<SharedPreferences>();

  final _dio = Dio();

  bool? _isStaffLoggedIn;

  LocationData? _locationData;
  String? wifiGatewayIP;
  String? getWifiIP;
  String? staffIn;

  Uint8List get image => const Base64Decoder().convert(_sharedPreference.getString('logo') ?? '');
  // List<Annoncement> get annoncement => [];
  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;
  String get userName => _sharedPreference.getString('name') ?? '';
  String get empId => _sharedPreference.getString('id') ?? '';

  String get token => _sharedPreference.getString('token') ?? '';
  List<Annoncement> get annoncement {
    var json1 = {"annoncement": json.decode(_sharedPreference.getString('annoncement') ?? "[{}]")};
    return LoginResponse.fromJson(json1).annoncement ?? [];
  }

  String get lat => _locationData?.latitude.toString() ?? '';
  String get long => _locationData?.longitude.toString() ?? '';
  String get gatewayIp => wifiGatewayIP.toString();
  String get ipadd => getWifiIP.toString();
  String get login => staffIn.toString();

  setLogIn() async {
    await staffLogin();
    await getCurrentLocation();
    await wifiIp();
    notifyListeners();
  }

  getCurrentLocation() async {
    Location location = Location();

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
    _locationData = await location.getLocation();

    log('lat : ' + (_locationData?.latitude.toString() ?? ''));
    log('long : ' + (_locationData?.longitude.toString() ?? ''));
  }

  wifiIp() async {
    NetworkInfo networkInfo = NetworkInfo();

    wifiGatewayIP = await networkInfo.getWifiGatewayIP();
    getWifiIP = await networkInfo.getWifiIP();

    log('gatewayIp: ' + (wifiGatewayIP.toString()));
    log('ipadd: ' + (ipadd.toString()));
  }

  Future<void> staffLogin() async {
    final request = {
      "atime": DateTime.now().toIso8601String(),
      "lat": long,
      "long": lat,
      "wifi": gatewayIp,
      "employeeID": empId,
      "description": "string",
    };

    final response = await _dio.post('http://rubric.rrwinfo.com/Staff/StaffAttendance',
        data: request,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));
    log(response.data.toString());
    _isStaffLoggedIn = response.data == "True";
    if (!(_isStaffLoggedIn ?? false)) {
      showErrDialog('You are not inside the campus');
    }
  }

  Future<void> logout() async {
    _sharedPreference.clear();
    goToLogin();
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }

  Future<void> section() async {
    if (_isStaffLoggedIn ?? true) {
      goToSection();
    } else {
      showErrDialog('please login after submit the Attendance');
    }
  }
}
