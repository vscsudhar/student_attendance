import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/app/app.router.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/service/locator.dart';

import '../models/students_model.dart';

mixin NavigationMixin {
  final NavigationService _navigationService = locator<NavigationService>();

  void goToDashboard() =>
      _navigationService.clearStackAndShow(Routes.dashboardView);
  void goToStudents(String cId, String hId, String subjectId) =>
      _navigationService.navigateTo(Routes.studentView,
          arguments:
              StudentViewArguments(cId: cId, hId: hId, subjectId: subjectId));
  void goToSection(LoginResponse? loginResponse) =>
      _navigationService.navigateTo(Routes.sectionView,
          arguments: SectionViewArguments(loginResponse: loginResponse));
  void goToProfiles() => _navigationService.navigateTo(Routes.profileView);
  void goToChangepassword() =>
      _navigationService.navigateTo(Routes.changepassView);
  void goToStudentDetails(GetStudentResponse student) =>
      _navigationService.navigateTo(Routes.studentDetailsView,
          arguments: StudentDetailsViewArguments(student: student));
  void goToStudentConfirmation(
          List<GetStudentResponse> absentList,
          List<GetStudentResponse> presentList,
          int cid,
          int hid,
          int subjectId) =>
      _navigationService.navigateTo(Routes.studentConfirmationView,
          arguments: StudentConfirmationViewArguments(
              absentStudentList: absentList,
              presentStudentList: presentList,
              cid: cid,
              hid: hid,
              subjectId: subjectId));
  void goToAnnouncementDetails(Annoncement annoncement) =>
      _navigationService.navigateTo(Routes.announcementDetailsView,
          arguments:
              AnnouncementDetailsViewArguments(annoncement: annoncement));
  void goToLogin() => _navigationService.navigateTo(Routes.loginView);
  void goToAttendanceView(int cId, int hId, DateTime sdate) =>
      _navigationService.navigateTo(Routes.attandanceView,
          arguments: AttandanceViewArguments(cid: cId, hid: hId, sdate: sdate));
  void goToViewSection(LoginResponse? loginResponse) =>
      _navigationService.navigateTo(Routes.viewSection,
          arguments: ViewSectionArguments(loginResponse: loginResponse));
}
