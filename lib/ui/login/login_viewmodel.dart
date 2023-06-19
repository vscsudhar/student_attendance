
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';

class LoginViewModel extends BaseViewModel with NavigationMixin {
  LoginViewModel() {
    _loginRequest = LoginRequest();
     init();
    }

    init() async {
      _sharedPreference = await SharedPreferences.getInstance();
  }

  final _dialogService = locator<DialogService>();
  // final _sharedPreference = locator<SharedPreferences>();

  String? _email;
  String? _password;
  late LoginRequest _loginRequest;
  late SharedPreferences _sharedPreference;

  final userAuthenticationService = locator<UserAuthenticationService>();


  String get email => _email ?? '';
  String get password => _password ?? '';
  LoginRequest get loginRequest => _loginRequest;

  void userLogin() async {
    final loginResponse = await userAuthenticationService.login(loginRequest);
    final token = loginResponse["token"];
    if (token != null && loginResponse != null) {
      _sharedPreference.setString('token', token);
      _sharedPreference.setString('user_credentials', loginResponse.toString());
      goToDashboard();
    } else {
      showErrDialog('login failed');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(title: "Message", description: message);
  }
}
