import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';

class SplasViewModel extends BaseViewModel with NavigationMixin {
  SplasViewModel() {
    userAutoLogin();
  }

  final _userAuthenticationService = locator<UserAuthenticationService>();
  late SharedPreferences _sharedPreference;

  Future<void> userAutoLogin() async {
    _sharedPreference = await SharedPreferences.getInstance();
    String email = _sharedPreference.getString('email') ?? '';
    String password = _sharedPreference.getString('password') ?? '';

    Future.delayed(const Duration(seconds: 3), () {
      if (email.isEmpty || password.isEmpty) {
        goToLogin();
      } else {
        _userAuthenticationService.login(LoginRequest(userId: email,password: password));
      }
    });
  }
}
