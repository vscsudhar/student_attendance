import 'package:stacked/stacked_annotations.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/login/login_view.dart';
import 'package:workspace/ui/section/section_view.dart';
import 'package:workspace/ui/students/students_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: DashboardView),
  MaterialRoute(page: StudentView),
  MaterialRoute(page: SectionView),
])
class App {}
