import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/save_attendance_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

import '../../core/models/students_model.dart';

class StudentConfirmationViewModel extends BaseViewModel with NavigationMixin {
  StudentConfirmationViewModel(
    this._cid,
    this._hid,
    this._subjectId,
    this._absentStudentList,
    this._presentStudentList,
  ) {
    print('cid : $_cid');
    print('hid : $_hid');
    print('subjectId : $_subjectId');
  }

  final _dialogService = locator<DialogService>();
  final _apiService = ApiService.init();
  final _sharedPreference = locator<SharedPreferences>();

  final int _cid;
  final int _hid;
  final int _subjectId;
  final DateTime _sdate = DateTime.now();
  bool? _isUpdatePresent;
  bool? _isUpdateAbsent;
  GlobalKey<AnimatedListState>? _key;

  final List<GetStudentResponse> _studentList = [];
  final List<GetStudentResponse> _absentStudentList;
  final List<GetStudentResponse> _presentStudentList;

  GetStudentResponse? _getStudentResponse;

  List<GetStudentResponse> get studentList => _studentList;
  List<GetStudentResponse> get absentStudentList => _absentStudentList;
  List<GetStudentResponse> get presentStudentList => _presentStudentList;

  int get insId => _sharedPreference.getInt('insId') ?? 0;

  GlobalKey<AnimatedListState>? get key => _key;

  int get cId => _cid;
  int get hId => _hid;
  int get empId => int.parse(_sharedPreference.getString('id') ?? '0');
  int get subjectId => _subjectId;
  String get rollNo => _getStudentResponse?.rollNo ?? '';
  DateTime get sdate => _sdate;
  bool get isUpdatePresent => _isUpdatePresent ?? false;
  bool get isUpdateAbsent => _isUpdateAbsent ?? false;
  //     final DateFormat formatter = DateFormat('yyyy-MM-dd');
  // String get sdate => formatter.format(_sdate);

  Future<void> saveStudentList() async {
    List<StudentAttendance> aList = [];
    List<StudentAttendance> pList = [];

    for (var element in absentStudentList) {
      aList.add(StudentAttendance(
        insId: insId,
        cid: cId,
        sdate: sdate,
        rollno: element.rollNo,
        subId: subjectId,
        hid: hId,
        attend: 0,
        status: 0,
        modOn: sdate,
      ));
    }

    for (var element in presentStudentList) {
      pList.add(StudentAttendance(
        insId: insId,
        cid: cId,
        sdate: sdate,
        rollno: element.rollNo,
        subId: subjectId,
        hid: hId,
        attend: 1,
        status: 1,
        modOn: sdate,
      ));
    }

    final _saveAttendance = SaveAttendanceRequest(classAttendances: [
      ClassAttendance(
        insId: insId,
        sdate: sdate,
        cid: cId,
        hid: hId,
        subId: subjectId,
        empId: empId,
        modOn: sdate,
        remarks: 'test',
      )
    ], studentAttendances: [
      ...pList,
      ...aList
    ]);
    notifyListeners();
    final reqJson = _saveAttendance.toJson().toString();
    print(reqJson);
    final res = await runBusyFuture(_apiService.saveAttendance(_saveAttendance))
        .catchError((error) {
      _dialogService.showCustomDialog(
          variant: DialogType.error, description: error.toString());
    });
    if (!hasError) {
      goToAttendanceView(cId, hId, sdate);
      print(res);
    } else {
      showErrDialog(modelError.toString());
      print(res);
    }
    print(res);
  }

  void showErrDialog(String message) {
    _dialogService.showCustomDialog(
        variant: DialogType.error, title: "Message", description: message);
  }

  void setEnablePresent(bool value) {
    _isUpdatePresent = value;
    notifyListeners();
  }

  void setEnableAbsent(bool value) {
    _isUpdateAbsent = value;
    notifyListeners();
  }

  void setUpdatePresent(GetStudentResponse student) {
    _absentStudentList.remove(student);
    _presentStudentList.add(student);
    notifyListeners();
  }

  void setUpdateAbsent(GetStudentResponse student) {
    _presentStudentList.remove(student);
    _absentStudentList.add(student);
    notifyListeners();
  }
}
