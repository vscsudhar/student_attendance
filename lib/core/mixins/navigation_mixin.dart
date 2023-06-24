import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/app/app.router.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/section_model.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/ui/profiles/profile_viewmodel.dart';

import '../models/students_model.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();


  void goToDashboard() => _navigationService.navigateTo(Routes.dashboardView);
  void goToStudents(List<Student>? studentList) => _navigationService.navigateTo(Routes.studentView, arguments: StudentViewArguments(students: studentList));
  void goToSection(LoginResponse? loginResponse) => _navigationService.navigateTo(Routes.sectionView, arguments: SectionViewArguments(loginResponse: loginResponse));
  void goToProfiles() => _navigationService.navigateTo(Routes.profileView);
  void goToChangepassword() => _navigationService.navigateTo(Routes.changepassView);
  void goToStudentDetails(int id) => _navigationService.navigateTo(Routes.studentDetailsView, arguments: StudentDetailsViewArguments(Id: id));
  void goToStudentConfirmation(List<Student> absentList, List<Student> presentList) => _navigationService.navigateTo(Routes.studentConfirmationView, arguments: StudentConfirmationViewArguments(absentStudentList: absentList, presentStudentList: presentList));
  void goToAnnouncementDetails(Annoncement annoncement) => _navigationService.navigateTo(Routes.announcementDetailsView, arguments: AnnouncementDetailsViewArguments(annoncement: annoncement));
  void goToLogin() => _navigationService.navigateTo(Routes.loginView);
}
