import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

class SplasViewModel extends BaseViewModel with NavigationMixin {
  SplasViewModel() {
    userAutoLogin();
  }

  late SharedPreferences _sharedPreference;

  Future<void> userAutoLogin() async {
    _sharedPreference = await SharedPreferences.getInstance();
    String token = _sharedPreference.getString('token') ?? '';

    // final userCredentials = _sharedPreference.getString('user_credentials');
    // LoginResponse loginResponse = userCredentials!=null ? loginResponseFromJson(userCredentials) : LoginResponse();

    Future.delayed(const Duration(seconds: 3), () {
      if (token.isEmpty) {
        goToLogin();
      } else {
        goToDashboard();
      }
    });
  }
}
