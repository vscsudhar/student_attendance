import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/api/api_service.dart';
import 'package:workspace/service/locator.dart';

class StudentsViewModel extends BaseViewModel with NavigationMixin {
  StudentsViewModel() {
    getstudents();
  }
  StudentsResponse? _response;

  List<Data> get studentList => _response?.data ?? [];

  final _apiSerivce = locator<ApiService>();
  Future<void> getstudents() async {
    _response = await runBusyFuture(_apiSerivce.getStudents());
  }
}
