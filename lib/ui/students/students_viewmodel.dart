import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/api/api_service.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel(this._cId) {
    getStudents();
  }

  final _apiService = ApiService.init();

  final String _cId;
  List<GetStudentResponse> _studentList = [];
  final List<GetStudentResponse> _absentStudentList = [];
  final List<GetStudentResponse> _presentStudentList = [];

  List<GetStudentResponse> get studentList => _studentList;
  List<GetStudentResponse> get absentStudentList => _absentStudentList;
  List<GetStudentResponse> get presentStudentList => _presentStudentList;

  void addAbsentList(GetStudentResponse student) {
    _absentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
    if (_studentList.isEmpty) {
      goToStudentConfirmation(absentStudentList, presentStudentList, int.parse(_cId), 1);
    }
  }

  void addPresentList(GetStudentResponse student) {
    _presentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
    if (_studentList.isEmpty) {
      goToStudentConfirmation(absentStudentList, presentStudentList, int.parse(_cId), 1);
    }
  }

  Future<void> getStudents() async {
    _studentList = await runBusyFuture(_apiService.getStudentDetails(_cId)).catchError((err) {});
  }
}
