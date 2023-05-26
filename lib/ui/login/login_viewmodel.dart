import 'dart:developer';

import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/busy_objects.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

import '../../core/helpers/error_handler.dart';

class LoginViewModel extends BaseViewModel with NavigationMixin {
  LoginViewModel() {
    _loginRequest = LoginRequest();
  }

  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();

  String? _email;
  String? _password;
  late LoginRequest _loginRequest;

  final p1 = LatLng(76.9660987, 10.90941317);
  final p2 = LatLng(76.9666191, 10.9087705);
  final p3 = LatLng(76.9672521, 10.9097976);
  final p4 = LatLng(76.9667478, 10.9103823);
  final p5 = LatLng(76.9660987, 10.9094131);
  final p6 = LatLng(76.9660987, 10.90941317);

  List<LatLng> get polygon => [p1, p2, p3, p4, p5, p6];

  bool get atLocation => PolygonUtil.containsLocation(LatLng(76.9660987, 10.9094131), polygon, false);
  String get email => _email ?? '';
  String get password => _password ?? '';
  LoginRequest get loginRequest => _loginRequest;

  Future<void> login() async {
    final loginResponse = await runBusyFuture(_apiService.login(loginRequest), busyObject: BusyObjects.isLogin);
    log(loginResponse.token ?? 'null');
    if (hasErrorForKey(BusyObjects.isLogin)) {
      _dialogService.showDialog(title: 'Message', description: errorHandler(error(BusyObjects.isLogin)));
    }
    if (loginResponse.token?.isNotEmpty ?? false) {
      goToDashboard(loginResponse);
    } else {
      showErrDialog('Login Failed.');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(title: "Message", description: message);
  }
}
