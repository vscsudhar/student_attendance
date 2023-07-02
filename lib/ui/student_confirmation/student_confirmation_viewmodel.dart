import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/save_attendance_model.dart';
import 'package:workspace/core/models/subject_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

import '../../core/models/get_class_hour_model.dart';
import '../../core/models/students_model.dart';

class StudentConfirmationViewModel extends BaseViewModel with NavigationMixin {
  StudentConfirmationViewModel(this.cid,this.hid);

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();
  final _saveAttendance = SaveAttendanceRequest(classAttendances: [], studentAttendances: []);

  final _sharedPreference = locator<SharedPreferences>();

  final int cid;
  final int hid;

  final List<GetStudentResponse> _studentList = [];
  final List<GetStudentResponse> _absentStudentList = [];
  final List<GetStudentResponse> _presentStudentList = [];
  GetClassHoursResponse? _getClassResponse;
  GetSubjectResponse? _getSubjectResponse;

  List<GetStudentResponse> get studentList => _studentList;
  List<GetStudentResponse> get absentStudentList => _absentStudentList;
  List<GetStudentResponse> get presentStudentList => _presentStudentList;


  Future<void> saveStudentList() async {

    final res = await runBusyFuture(_apiService.saveAttendance(_saveAttendance)).catchError((error) {
      _dialogService.showCustomDialog(variant: DialogType.error, description: error.toString());
    });
    print(saveStudentList());
    if (!hasError) {
      res == 'true';
    } else {
      showErrDialog('please check the data');
    }
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
