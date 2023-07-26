import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';
import 'package:workspace/core/models/attendance_response.dart';

import '../../service/api/api_service.dart';

class AttendanceViewModel extends BaseViewModel with NavigationMixin {
  AttendanceViewModel(
    this._cid,
    this._hid,
    this._sdate,
  ) {
    getAttendanceView();
  }

  List<AttendanceViewResponse>? _attendanceViewResponse;

  final _apiService = ApiService.init();

  List<AttendanceViewResponse>? _absentView;
  List<AttendanceViewResponse>? _presentView;

  final int _cid;
  final int _hid;
  final DateTime _sdate;

    final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String get sdate => formatter.format(_sdate);

  List<AttendanceViewResponse> get studentAttendanceList => _attendanceViewResponse ?? [];
  List<AttendanceViewResponse> get absentView => studentAttendanceList.where((element) => element.attend == '0').toList();
  List<AttendanceViewResponse> get presentView => studentAttendanceList.where((element) => element.attend == '1').toList();

  Future<void> getAttendanceView() async {
    _attendanceViewResponse = await runBusyFuture(_apiService.getAttendanceView(sdate, _cid.toString(), _hid.toString()));
  }
}
