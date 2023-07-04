import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:local_session_timeout/local_session_timeout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/app/app.router.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/service/api/api_service.dart';

import '../core/models/login_model.dart';
import 'locator.dart';

class UserAuthenticationService with NavigationMixin {
  final _sharedPreference = locator<SharedPreferences>();

  final _dio = Dio();
  final _dialogService = locator<DialogService>();

  final SessionConfig _sessionConfig = SessionConfig(invalidateSessionForAppLostFocus: const Duration(seconds: 8), invalidateSessionForUserInactivity: const Duration(seconds: 10));
  //final _sessionConfig = SessionConfig();
  LoginResponse? _loginResponse;

  SessionConfig get sessionConfig => _sessionConfig;

  String get token => _loginResponse?.token ?? 'Empty token';
  String get userCredentials => _sharedPreference.getString('email') ?? '';


  LoginResponse get loginResponse => _loginResponse ?? LoginResponse();

  Future<dynamic> login(LoginRequest loginRequest) async {
    _loginResponse = await locator<ApiService>().login(loginRequest).catchError((e) {
      _dialogService.showCustomDialog(variant: DialogType.error, description: e.toString());
      return e;
    });
    _sharedPreference.setString('email', loginRequest.userId ?? '');
    _sharedPreference.setString('password', loginRequest.password ?? '');
    if (_loginResponse?.token != null) {
      log('token : ' + (_loginResponse?.token ?? ''));
      _sharedPreference.setString('name', _loginResponse?.name ?? '');
      _sharedPreference.setString('id', _loginResponse?.employeeId ?? '');
      _sharedPreference.setString('annoncement', json.encode(_loginResponse?.annoncement));
      _sharedPreference.setString('logo', _loginResponse?.logo ?? '');
      goToDashboard();
    } else {
      _dialogService.showCustomDialog(variant: DialogType.error, description: 'Login Failed');
    }
  }

  Future<void> autoLogout() async {
    log('autologOut 2');
    final _sessionConfig = SessionConfig(invalidateSessionForAppLostFocus: const Duration(seconds: 8), invalidateSessionForUserInactivity: const Duration(seconds: 10));
    _sessionConfig.stream.listen((SessionTimeoutState timeoutEvent) {
      if (timeoutEvent == SessionTimeoutState.userInactivityTimeout || timeoutEvent == SessionTimeoutState.appFocusTimeout) {
        locator<SharedPreferences>().clear();
        locator<NavigationService>().navigateToLoginView();
      }
    });
    //stream.cancel();
  }

  Future<void> refreshSession() async {
    String email = _sharedPreference.getString('email') ?? '';
    String password = _sharedPreference.getString('password') ?? '';

    await login(LoginRequest(userId: email, password: password));
  }
}


    // final request = {"userID": "${loginRequest.userId}", "password": "${loginRequest.password}"};
    // final response = await _dio.post('http://rubric.rrwinfo.com/Accounts/Login',
    //     data: request,
    //     options: Options(
    //       headers: {
    //         'Content-Type': 'application/json',
    //         'Accept': 'application/json',
    //       },
    //     ));
    // _loginResponse = LoginResponse.fromJson(response.data);