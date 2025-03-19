import 'package:stacked/stacked_annotations.dart';
import 'package:workspace/ui/announcement_details/announcement_details_view.dart';
import 'package:workspace/ui/attendance_view/attendance_view.dart';
import 'package:workspace/ui/changepassword/changepass_view.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/profiles/profile_view.dart';
import 'package:workspace/ui/section/section_view.dart';
import 'package:workspace/ui/splash/splash_view.dart';
import 'package:workspace/ui/student_confirmation/student_confirmation_view.dart';
import 'package:workspace/ui/student_details/studentsdetails_view.dart';
import 'package:workspace/ui/students/students_view.dart';
import 'package:workspace/ui/view_section/view_section_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: DashboardView),
  MaterialRoute(page: StudentView),
  MaterialRoute(page: SectionView),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: ChangepassView),
  MaterialRoute(page: StudentDetailsView),
  MaterialRoute(page: StudentConfirmationView),
  MaterialRoute(page: AnnouncementDetailsView),
  MaterialRoute(page: AttandanceView),
  MaterialRoute(page: ViewSection),
])
class App {}
