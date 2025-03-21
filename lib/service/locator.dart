import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/user_authentication_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  var sharedPreference = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreference);
  locator.registerLazySingleton(() => UserAuthenticationService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<ApiService>(() => ApiService.init());
}
