import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel(this._studentList);

  final List<Data> _studentList;
  final List<Data> _absentStudentList = [];
  final List<Data> _presentStudentList = [];

  List<Data> get studentList => _studentList;
  List<Data> get absentStudentList => _absentStudentList;
  List<Data> get presentStudentList => _presentStudentList;

  void addAbsentList(Data data) {
    _absentStudentList.add(data);
    _studentList.remove(data);
    notifyListeners();
  }

  void addPresentList(Data data) {
    _presentStudentList.add(data);
    _studentList.remove(data);
    notifyListeners();
  }
}
