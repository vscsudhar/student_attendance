import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/attendance_response.dart';
import 'package:workspace/core/models/get_boundry.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/save_attendance_model.dart';
import 'package:workspace/core/models/subject_model.dart';
import 'package:workspace/core/models/get_class_hour_model.dart';
import 'package:workspace/core/models/students_model.dart';
import 'package:workspace/service/locator.dart';
import 'package:workspace/service/user_authentication_service.dart';

import '../../core/models/staff_login_model.dart';

part 'api_service.g.dart';

@RestApi(
    // parser: Parser.FlutterCompute,
    )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'http://rubric.vewinpro.com';
    try {
      if (locator<UserAuthenticationService>().token.isNotEmpty) {
        log(locator<UserAuthenticationService>().token);
        dio.options.headers['Authorization'] =
            'Bearer ${locator<UserAuthenticationService>().token}';
        dio.interceptors.add(PrettyDioLogger(requestBody: true));
      }
    } catch (e) {
      print(e);
    }
    return ApiService(dio);
  }

  @POST('/Accounts/Login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('/GetClassHours')
  Future<GetClassHoursResponse> getClasses();

  @GET('/Staff/GetBoundry')
  Future<GetBoundryResponse> getBoundries();

  @POST('/Staff/StaffAttendance')
  Future<dynamic> staffAttendance(@Body() StaffLoginRequest staffLoginRequest);

  @POST('/GetSubject?dd={sdate}&cid={cid}&hid={hid}')
  Future<List<GetSubjectResponse>> getSubjectDetails(
      @Path('sdate') String sdate,
      @Path('cid') String cId,
      @Path('hid') String hId);

  @POST('/GetStudents?cid={cid}')
  Future<List<GetStudentResponse>> getStudentDetails(@Path('cid') String cId);

  @POST('/SaveAttendance')
  Future<dynamic> saveAttendance(
      @Body() SaveAttendanceRequest saveAttendanceRequest);

  @GET('/GetStudentAttendance?date={date}&cid={cid}&hid={hid}')
  Future<List<AttendanceViewResponse>> getAttendanceView(
      @Path('date') String sdate,
      @Path('cid') String cId,
      @Path('hid') String hId);
}
