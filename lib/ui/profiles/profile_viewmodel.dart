import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/service/locator.dart';

class ProfileViewModel extends BaseViewModel with NavigationMixin {
  ProfileViewModel();

  final _sharedPreference = locator<SharedPreferences>();

  String get userName => _sharedPreference.getString('name') ?? '';
  String get empId => _sharedPreference.getString('id') ?? '';
  // String get Image => _sharedPreference.getString('img') ?? 'img';
}
