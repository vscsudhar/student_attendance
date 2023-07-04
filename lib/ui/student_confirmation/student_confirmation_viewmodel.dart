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
  StudentConfirmationViewModel(this.cid, this.hid, this.subjectId, this._absentStudentList, this._presentStudentList) {
    print('cid : $cid');
    print('hid : $hid');
    print('subjectId : $subjectId');
    // saveStudentList();
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();
  final _sharedPreference = locator<SharedPreferences>();

  final int cid;
  final int hid;
  final int subjectId;

  final List<GetStudentResponse> _studentList = [];
  final List<GetStudentResponse> _absentStudentList = [];
  final List<GetStudentResponse> _presentStudentList = [];
  GetClassHoursResponse? _getClassResponse;
  GetSubjectResponse? _getSubjectResponse;
  GetStudentResponse? _getStudentResponse;

  List<GetStudentResponse> get studentList => _studentList;
  List<GetStudentResponse> get absentStudentList => _absentStudentList;
  List<GetStudentResponse> get presentStudentList => _presentStudentList;

  int get cId => cid;
  int get hId => hid;
  int get empId => int.parse(_sharedPreference.getString('id') ?? '0');
  int get insId => 1;
  int? get subid => subjectId;
  String get rollNo => _getStudentResponse?.rollNo ?? '';

  Future<void> saveStudentList() async {
    List<StudentAttendance> aList = [];
    List<StudentAttendance> pList = [];

    for (var element in absentStudentList) {
      aList.add(StudentAttendance(
        attend: 0,
        cid: cId,
        hid: hId,
        insId: insId,
        rollno: element.rollNo,
        sdate: DateTime.now(),
        subId: subid,
        status: 0,
        modOn: DateTime.now(),
      ));
    }

    for (var element in presentStudentList) {
      pList.add(StudentAttendance(
        attend: 1,
        cid: cId,
        hid: hId,
        insId: insId,
        rollno: element.rollNo,
        sdate: DateTime.now(),
        subId: subid,
        status: 1,
        modOn: DateTime.now(),
      ));
    }

    final _saveAttendance = SaveAttendanceRequest(classAttendances: [
      ClassAttendance(
        cid: cId,
        hid: hId,
        empId: empId,
        insId: insId,
        remarks: 'test',
        sdate: DateTime.now(),
        subId: subid,
        modOn: DateTime.now(),
      )
    ], studentAttendances: [
      ...pList,
      ...aList
    ]);
    final res = await runBusyFuture(_apiService.saveAttendance(_saveAttendance)).catchError((error) {
      _dialogService.showCustomDialog(variant: DialogType.error, description: error.toString());
    });
    if (!hasError) {
      print(res);
    } else {
      showErrDialog('please check the data');
    }
    print(res);
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(variant: DialogType.error, title: "Message", description: message);
  }
}
