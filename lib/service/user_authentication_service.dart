import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/models/login_model.dart';
import 'locator.dart';

class UserAuthenticationService {
  UserAuthenticationService.getInstance() {
    init();
  }

  init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  final _dio = Dio();
  final _dialogService = locator<DialogService>();
  late SharedPreferences _sharedPreference;

  Map<String, dynamic>? _loginResponse;

  String get token => _sharedPreference.getString('token') ?? '';

  LoginResponse get loginResponse => loginResponseFromJson(_sharedPreference.getString('user_credentials') ?? '');

  Future<dynamic> login(LoginRequest loginRequest) async {
    final request = {"userID": "${loginRequest.userId}", "password": "${loginRequest.password}"};
    final response = await _dio.post('http://rubric.rrwinfo.com/Accounts/Login',
        data: request,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ));
    _loginResponse = response.data;
    log('token : ' + (_loginResponse?["token"] ?? ''));
    // _sharedPreference.setString('user_credentials', _loginResponse.toString());

    if (response.statusCode != 200) {
      _dialogService.showDialog(title: 'Message', description: 'login failed');
    }

    return response.data;
  }
}
