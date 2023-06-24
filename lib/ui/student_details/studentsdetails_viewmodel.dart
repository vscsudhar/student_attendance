import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_details_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

class StudentDetailsViewModel extends BaseViewModel with NavigationMixin {
  StudentDetailsViewModel(this._Id) {
    getStudentDetails();
  }

  final int _Id;

  StudentsDetailsResponse? _studentsDetailsResponse;

  Data? get data => _studentsDetailsResponse?.data;
  final _apiService = locator<ApiService>();
  Future<void> getStudentDetails() async {
    // _studentsDetailsResponse = await runBusyFuture(_apiService.getStudentDetails(_Id.toString()));
  }
}
