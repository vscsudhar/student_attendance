import 'package:stacked/stacked_annotations.dart';
import 'package:workspace/ui/announcement_details/announcement_details_view.dart';
import 'package:workspace/ui/changepassword/changepass_view.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/profiles/profile_view.dart';
import 'package:workspace/ui/section/section_view.dart';
import 'package:workspace/ui/student_confirmation/student_confirmation_view.dart';
import 'package:workspace/ui/student_details/studentsdetails_view.dart';
import 'package:workspace/ui/students/students_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: DashboardView),
  MaterialRoute(page: StudentView),
  MaterialRoute(page: SectionView),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: ChangepassView),
  MaterialRoute(page: StudentDetailsView),
  MaterialRoute(page: StudentConfirmationView),
  MaterialRoute(page: AnnouncementDetailsView),
])
class App {}
