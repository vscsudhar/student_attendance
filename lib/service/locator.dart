import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/service/api/api_service.dart';

final locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton<ApiService>(() => ApiService.init());
}
