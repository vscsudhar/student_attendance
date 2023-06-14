import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

import '../core/models/login_model.dart';
import 'locator.dart';

class UserAuthenticationService {
  final _sharedPreference = locator<SharedPreferences>();

  final _dio = Dio();
  final _dialogService = locator<DialogService>();

 LoginResponse? _loginResponse;

  String get token => _sharedPreference.getString('token') ?? '';

  LoginResponse get loginResponse => _loginResponse ?? LoginResponse();

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
    _loginResponse = LoginResponse.fromJson(response.data) ;
    log('token : ' + (_loginResponse?.token ?? ''));
    _sharedPreference.setString('user_credentials', json.encode(_loginResponse));
    _sharedPreference.setString('name', _loginResponse?.name ?? '');
    _sharedPreference.setString('id',  _loginResponse?.employeeId ?? '');
    _sharedPreference.setString('logo', _loginResponse?.logo ?? '');

    if (response.statusCode != 200) {
      _dialogService.showDialog(title: 'Message', description: 'login failed');
    }

    return response.data;
  }
}
