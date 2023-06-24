import 'dart:core';

import 'dart:developer';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:workspace/core/enum/dialog_type.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/dropdown_model.dart';
import 'package:workspace/core/models/section_model.dart';
import 'package:workspace/core/models/get_class_hour_model.dart';

import '../../core/models/login_model.dart';
import '../../service/api/api_service.dart';
import '../../service/locator.dart';

class SectionViewModel extends BaseViewModel with NavigationMixin {
  SectionViewModel(this._loginResponse) {
    getClasses();
  }
  final _apiSerivce = ApiService.init();

  final _dialogService = locator<DialogService>();

  SectionResponse? _response;

  final LoginResponse? _loginResponse;

  GetClassHoursResponse? _getClassResponse;
  String? _cid;
  String? _classClass;
  String? _year;
  String? _insId;
  String? _section;
  String? _hours;
  int? _hid;

  List<Student> get studentList => _response?.students ?? [];
  String get insType => _loginResponse?.insType ?? '';
  String get cid => _cid.toString();
  String get classClass => _classClass?.toString() ?? (classNames.isNotEmpty ? classNames.first : '');
  String get year => _year?.toString() ?? (years.isNotEmpty ? years.first : '');
  String get insId => _insId.toString();
  String get section => _section?.toString() ?? (sections.isNotEmpty ? sections.first : '');
  String get hours => _hours ?? (hoursList.isNotEmpty ? hoursList.first : '');
  int get hid => _hid ?? 0;

  List<ClassElement> get classes => _getClassResponse?.classes ?? [];
  List<Hour> get hour => _getClassResponse?.hour ?? [];
  List<String> get classNames => classes.map((classElement) => classElement.classClass.toString()).toSet().toList();
  List<String> get years => classes.map((classElement) => classElement.year.toString()).toSet().toList();
  List<String> get sections => classes.map((classElement) => classElement.section.toString()).toSet().toList();
  List<String> get hoursList => hour.map((hourElement) => hourElement.hours ?? '').toSet().toList();

  List<DropDownModel> get hourlist => hour.map((hourElement) => DropDownModel(name: hourElement.hours.toString(), value: hourElement.hours)).toList();
  List<DropDownModel> get classList => classNames.map((className) => DropDownModel(name: className, value: className)).toList();
  List<DropDownModel> get yearsList => years.map((year) => DropDownModel(name: year, value: year)).toList();
  List<DropDownModel> get sectionsList => sections.map((section) => DropDownModel(name: section, value: section)).toList();

  List<DropDownModel> get subjectList => [];

  selectClassName(className) {
    _classClass = className;
    notifyListeners();
  }

  selectYearName(years) {
    _year = years;
    notifyListeners();
  }

  selectSectionName(sections) {
    _section = sections;
    notifyListeners();
  }

  selectHourName(hours) async {
    _hours = hours;
    notifyListeners();
    try {
      _cid = classes.firstWhere((element) => element.classClass! == classClass && element.year != year && element.section! == section).cid.toString();
      _hid = hour.firstWhere((element) => element.hours! == hours).hid;
    } catch (e) {
      print(e);
    }
    await getstudents();
  }

  Future<void> getClasses() async {
    _getClassResponse = await runBusyFuture(_apiSerivce.getClasses());
    if (hasError) {
      _dialogService.showCustomDialog(variant: DialogType.error, description: 'Something went wrong...!');
    }
  }

  Future<void> getstudents() async {
    _response = await _apiSerivce.getSectionDetails(cid, hid.toString());
    if (hasError) {
      log('Something went wrong..!');
    } else if (_response?.students?.isNotEmpty ?? false) {
      goToStudents(_response?.students ?? []);
    }
  }
}
