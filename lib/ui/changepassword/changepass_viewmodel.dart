import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

import '../../service/locator.dart';

class ChangepassViewModel extends BaseViewModel with NavigationMixin {
  ChangepassViewModel();

  final _sharedPreference = locator<SharedPreferences>();

  String get userName => _sharedPreference.getString('name') ?? '';
  String get empId => _sharedPreference.getString('id') ?? '';
}
