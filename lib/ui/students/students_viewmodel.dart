import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/section_model.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel(this._studentList);

  final List<Student> _studentList;
  final List<Student> _absentStudentList = [];
  final List<Student> _presentStudentList = [];

  List<Student> get studentList => _studentList;
  List<Student> get absentStudentList => _absentStudentList;
  List<Student> get presentStudentList => _presentStudentList;

  void addAbsentList(Student student) {
    _absentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
  }

  void addPresentList(Student student) {
    _presentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
  }
}
