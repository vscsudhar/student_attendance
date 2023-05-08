import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/app/app.router.dart';
import 'package:workspace/service/locator.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToDashboard() => _navigationService.navigateTo(Routes.dashboardView);
  void goToStudents() => _navigationService.navigateTo(Routes.studentView);
  void goToSection() => _navigationService.navigateTo(Routes.sectionView);
  void goToProfiles() => _navigationService.navigateTo(Routes.profileView);
}
