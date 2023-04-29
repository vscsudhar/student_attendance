import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/app/app.router.dart';
import 'package:workspace/service/locator.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToDashboard() => _navigationService.navigateTo(Routes.dashboardView);
}
