import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

import '../../core/enum/dialog_type.dart';
import '../../core/models/attendance_response.dart';
import '../../core/models/dropdown_model.dart';
import '../../core/models/get_class_hour_model.dart';
import '../../core/models/login_model.dart';
import '../../core/models/subject_model.dart';
import '../../service/api/api_service.dart';
import '../../service/locator.dart';

class ViewSectionModel extends BaseViewModel with NavigationMixin {
  ViewSectionModel(this._loginResponse) {
    getClasses();
  }
  final _apiSerivce = ApiService.init();

  final _dialogService = locator<DialogService>();

  List<GetSubjectResponse>? _subjectListResponse;

  List<AttendanceViewResponse>? _attendanceViewResponse;
  final _apiService = ApiService.init();

  final LoginResponse? _loginResponse;
  GetClassHoursResponse? _getClassResponse;
  int? _cid;
  String? _classClass;
  String? _year;
  String? _insId;
  String? _section;
  String? _hours;
  String? _subject;
  String? _subjectId;
  int? _hid;
  bool _isValid = false;
  DateTime? _sdate;

  String get insType => _loginResponse?.insType ?? '';
  int get cid => _cid ?? 0;
  String? get classClass => _classClass;
  String? get year => _year;
  String? get insId => _insId.toString();
  String? get section => _section;
  String? get hours => _hours;
  String? get subject => _subject;
  String? get subjectId => _subjectId;
  int get hid => _hid ?? 0;
  DateTime get sdate => _sdate ?? DateTime.now();

  List<ClassElement> get classes => _getClassResponse?.classes ?? [];
  List<Hour> get hour => _getClassResponse?.hour ?? [];
  List<String> get classNames => classes
      .map((classElement) => classElement.classClass.toString())
      .toSet()
      .toList();
  List<String> get years => classes
      .map((classElement) => classElement.year.toString())
      .toSet()
      .toList();
  List<String> get sections => classes
      .map((classElement) => classElement.section.toString())
      .toSet()
      .toList();
  List<String> get hoursList =>
      hour.map((hourElement) => hourElement.hours ?? '').toSet().toList();

  List<DropDownModel> get hourlist => hour
      .map((hourElement) => DropDownModel(
          name: hourElement.hours.toString(), value: hourElement.hours))
      .toList();
  List<DropDownModel> get classList => classNames
      .map((className) => DropDownModel(name: className, value: className))
      .toList();
  List<DropDownModel> get yearsList =>
      years.map((year) => DropDownModel(name: year, value: year)).toList();
  List<DropDownModel> get sectionsList => sections
      .map((section) => DropDownModel(name: section, value: section))
      .toList();

  List<GetSubjectResponse> get subjectListResponse =>
      _subjectListResponse ?? [];

  List<DropDownModel> get subjectList => subjectListResponse
      .map((subject) =>
          DropDownModel(name: subject.subject, value: subject.subject))
      .toList();

  bool get isvalid => _isValid;

  selectClassName(className) async {
    _classClass = className;
    _year = null;
    _section = null;
    _hours = null;
    resetSelection();
    notifyListeners();
  }

  selectYearName(years) async {
    _year = years;
    _section = null;
    _hours = null;
    resetSelection();
    notifyListeners();
  }

  selectSectionName(sections) async {
    _section = sections;
    _hours = null;
    resetSelection();
    notifyListeners();
  }

  selectHourName(hours) async {
    _hours = hours;
    // _isValid = true;
    // _subject = null;
    notifyListeners();
    resetSelection();
    await getSubjects();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      _sdate = pickedDate;
      notifyListeners();
    }
  }

  selectSubject(subjects) {
    _subject = subjects;
    _isValid = true;
    _subjectId = _subjectListResponse
        ?.firstWhere((element) => element.subject == subjects)
        .subId
        .toString();
    // attendanceView();
    notifyListeners();
  }

  resetSelection() {
    _subjectListResponse = [];
    _isValid = false;
  }

  // Future<void> attendanceView() async {
  //   _attendanceViewResponse = await runBusyFuture(_apiService.getAttendanceView(sdate.toString(), cid.toString(), hid.toString()));
  //   goToAttendanceView(cid as int, hid, sdate);
  // }

  // attendance() {
  //   _cid = classes.firstWhere((element) => (element.classClass! == classClass) && (element.year! == year) && (element.section! == section)).cid.toString();
  //   goToStudents(_cid!, _hid.toString(), _subjectId.toString());
  // }

  Future<void> getClasses() async {
    _getClassResponse = await runBusyFuture(_apiSerivce.getClasses());
    if (hasError) {
      _dialogService.showCustomDialog(
          variant: DialogType.error, description: 'Something went wrong...!');
    } else {
      // await getSubjects();
    }
  }

  Future<void> getSubjects() async {
    try {
      _cid = classes
          .firstWhere((element) =>
              (element.classClass! == classClass) &&
              (element.year! == year) &&
              (element.section! == section))
          .cid;
      _hid = hour.firstWhere((element) => element.hours! == hours).hid;
    } catch (e) {
      print(e);
    }
    _subjectListResponse = [];
    _subjectListResponse = await runBusyFuture(_apiSerivce.getSubjectDetails(
        cid.toString(), hid.toString(), sdate.toString()));
    //  busyObject: BusyObjects.studentDetails).catchError((err) {
    //   _dialogService.showCustomDialog(variant: DialogType.error, description: 'Error, Already Marked or Subjects not Mapped for the Class, Retry');
    _isValid = false;
    // }
    // );
    if (hasError) {
      log('Something went wrong..!');
    } else if (_subjectListResponse?.isNotEmpty ?? false) {
      _isValid = false;
      notifyListeners();
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.error, description: 'Subjects are not available');
      _isValid = false;
    }
  }
}
