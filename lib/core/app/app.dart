import 'package:stacked/stacked_annotations.dart';
import 'package:workspace/ui/dashboard/dashboard_view.dart';
import 'package:workspace/ui/login/login_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: LoginView, initial: true),
  MaterialRoute(page: DashboardView)
])
class App {}
