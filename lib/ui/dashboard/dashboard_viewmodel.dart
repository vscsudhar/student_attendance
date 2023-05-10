import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

class DashboardViewmodel extends BaseViewModel with NavigationMixin {
  bool? _isStaffLoggedIn;

  bool get isStaffLoggedIn => _isStaffLoggedIn ?? false;

  setLogIn(bool isStaffLoggedIn) {
    _isStaffLoggedIn = isStaffLoggedIn;
    notifyListeners();
  }
}
