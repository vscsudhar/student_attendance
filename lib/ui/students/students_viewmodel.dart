import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/api/api_service.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel(this._cId, this._hId, this._subjectId, this._key) {
    getStudents();
  }

  final _apiService = ApiService.init();

  final String _cId;
  final String _hId;
  final String _subjectId;
  final GlobalKey<AnimatedListState> _key;

  List<GetStudentResponse> _studentList = [];
  final List<GetStudentResponse> _absentStudentList = [];
  final List<GetStudentResponse> _presentStudentList = [];

  List<GetStudentResponse> get studentList => _studentList;
  List<GetStudentResponse> get absentStudentList => _absentStudentList;
  List<GetStudentResponse> get presentStudentList => _presentStudentList;

  GlobalKey<AnimatedListState> get key => _key;

  void addAbsentList(GetStudentResponse student) {
    _absentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
    if (_studentList.isEmpty) {
      goToStudentConfirmation(absentStudentList, presentStudentList,
          int.parse(_cId), int.parse(_hId), int.parse(_subjectId));
    }
  }

  void addPresentList(GetStudentResponse student) {
    print(_studentList.length);
    _presentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
    if (_studentList.isEmpty) {
      goToStudentConfirmation(absentStudentList, presentStudentList,
          int.parse(_cId), int.parse(_hId), int.parse(_subjectId));
    }
  }

  Future<void> getStudents() async {
    setBusy(true);
    _studentList =
        await _apiService.getStudentDetails(_cId).catchError((err) {});
    // _key.currentState?.insertAllItems(0, studentList.length, duration: const Duration(milliseconds: 10));
    _key.currentState
        ?.insertItem(0, duration: const Duration(milliseconds: 10));
    // _studentList.forEach((element) {});
    setBusy(false);
  }
}
