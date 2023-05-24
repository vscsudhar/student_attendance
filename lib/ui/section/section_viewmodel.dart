import 'dart:developer';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';

import '../../service/api/api_service.dart';
import '../../service/locator.dart';

class SectionViewModel extends BaseViewModel with NavigationMixin {
  SectionViewModel();

  StudentsResponse? _response;

  List<Data> get studentList => _response?.data ?? [];

  final _classList = [
    const DropDownValueModel(name: 'CSE', value: '1'),
    const DropDownValueModel(name: 'ECE', value: '2'),
    const DropDownValueModel(name: 'EEE', value: '3'),
    const DropDownValueModel(name: 'CIVIL', value: '4'),
  ];
  final _yearList = [
    const DropDownValueModel(name: 'First', value: '1'),
    const DropDownValueModel(name: 'Second', value: '2'),
    const DropDownValueModel(name: 'Third', value: '3'),
    const DropDownValueModel(name: 'Final', value: '4'),
  ];
  final _sectionlist = [
    const DropDownValueModel(name: 'Section A', value: 'A'),
    const DropDownValueModel(name: 'Section B', value: 'B'),
  ];
  final _subjectList = [
    const DropDownValueModel(name: 'Tamil', value: '1'),
    const DropDownValueModel(name: 'English', value: '2'),
    const DropDownValueModel(name: 'Maths', value: '3'),
  ];

  List<DropDownValueModel> get classList => _classList;
  List<DropDownValueModel> get yearList => _yearList;
  List<DropDownValueModel> get sectionlist => _sectionlist;
  List<DropDownValueModel> get subjectList => _subjectList;

  final _apiSerivce = locator<ApiService>();
  Future<void> getstudents() async {
    _response = await runBusyFuture(_apiSerivce.getStudents());
    if (hasError) {
      log('Something went wrong..!');
    } else if (_response?.data?.isNotEmpty ?? false) {
      goToStudents(_response?.data ?? []);
    }
  }
}
