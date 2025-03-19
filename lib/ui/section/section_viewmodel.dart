import 'dart:convert';
import 'dart:core';

import 'dart:developer';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/busy_objects.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/dropdown_model.dart';
import 'package:workspace/core/models/subject_model.dart';
import 'package:workspace/core/models/get_class_hour_model.dart';

import '../../core/models/login_model.dart';
import '../../service/api/api_service.dart';
import '../../service/locator.dart';

class SectionViewModel extends BaseViewModel with NavigationMixin {
  SectionViewModel(this._loginResponse) {
    getClasses();
    print(sdate);
  }
  final _apiSerivce = ApiService.init();

  final _dialogService = locator<DialogService>();
  final _sharedPreference = locator<SharedPreferences>();

  List<GetSubjectResponse>? _subjectListResponse;

  final LoginResponse? _loginResponse;

  GetClassHoursResponse? _getClassResponse;
  String? _cid;
  String? _classClass;
  String? _year;
  String? _insId;
  String? _section;
  String? _hours;
  String? _subject;
  String? _subjectId;
  int? _hid;
  bool _isValid = false;

  String get insType => _loginResponse?.insType ?? '';
  String get cid => _cid.toString();
  String? get classClass => _classClass;
  String? get year => _year;
  String? get insId => _insId.toString();
  String? get section => _section;
  String? get hours => _hours;
  String? get subject => _subject;
  String? get subjectId => _subjectId;
  int get hid => _hid ?? 0;
  final DateTime _sdate = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  Uint8List get image =>
      const Base64Decoder().convert(_sharedPreference.getString('logo') ?? '');

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
  String get sdate => formatter.format(_sdate);

  //String get sdate => _sdate.toIso8601String().replaceAll('T00:00:00.000000', '');

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
    _subject = null;
    notifyListeners();
    resetSelection();
    await getSubjects();
    // await goToStudent();
  }

  selectSubject(subjects) {
    _subject = subjects;
    _isValid = true;
    _subjectId = _subjectListResponse
            ?.firstWhere((element) => element.subject == subjects)
            .subId
            .toString() ??
        '0';
    notifyListeners();
  }

  resetSelection() {
    _subjectListResponse = [];
    _isValid = false;
  }

  goToStudent() {
    _cid = classes
        .firstWhere((element) =>
            (element.classClass! == classClass) &&
            (element.year! == year) &&
            (element.section! == section))
        .cid
        .toString();
    // _hid = hour.firstWhere((element) => element.hours! == hours).hid;

    goToStudents(_cid!, _hid.toString(), _subjectId.toString());
  }

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
          .cid
          .toString();
      _hid = hour.firstWhere((element) => element.hours! == hours).hid;
    } catch (e) {
      print(e);
    }
    _subjectListResponse = [];
    _subjectListResponse = await runBusyFuture(
            _apiSerivce.getSubjectDetails(sdate, cid, hid.toString()),
            busyObject: BusyObjects.studentDetails)
        .catchError((err) {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          description:
              ' Error, Already Marked or Subjects not Mapped for the Class, Retry');
      _isValid = false;
    });
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
