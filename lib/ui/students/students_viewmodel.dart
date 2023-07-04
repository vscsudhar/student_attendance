import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/api/api_service.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel(this._cId,this._hId,this._subjectId) {
    getStudents();
  }

  final _apiService = ApiService.init();

  final String _cId;
  final String _hId;
  final String _subjectId;
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
      goToStudentConfirmation(absentStudentList, presentStudentList, int.parse(_cId), int.parse(_hId),int.parse(_subjectId));
    }
  }

  void addPresentList(GetStudentResponse student) {
    _presentStudentList.add(student);
    _studentList.remove(student);
    notifyListeners();
    if (_studentList.isEmpty) {
      goToStudentConfirmation(absentStudentList, presentStudentList, int.parse(_cId), int.parse(_hId), int.parse(_subjectId));
    }
  }

  Future<void> getStudents() async {
    _studentList = await runBusyFuture(_apiService.getStudentDetails(_cId)).catchError((err) {});
  }
}
