import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/boundry_model.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/section_model.dart';
import 'package:workspace/core/models/get_class_hour_model.dart';
import 'package:workspace/core/models/students_details_model.dart';
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
    dio.options.baseUrl = 'http://rubric.rrwinfo.com';
    try {
      if (locator<UserAuthenticationService>().token.isNotEmpty) {
        log(locator<UserAuthenticationService>().token);
        dio.options.headers['Authorization'] = 'Bearer ${locator<UserAuthenticationService>().token}';
        dio.interceptors.add(PrettyDioLogger(requestBody: true));
      }
    } catch (e) {
      print(e);
    }
    return ApiService(dio);
  }

  @POST('/Accounts/Login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('/Staff/GetBoundry')
  Future<BoundryResponse> getBoundries();

  @GET('/GetClassHours')
  Future<GetClassHoursResponse> getClasses();

  @POST('/Staff/StaffAttendance')
  Future<String> staffAttendance(@Body() StaffLoginRequest staffLoginRequest);

  @POST('/GetSubject?cid={cid}&hid={hid}')
  Future<SectionResponse> getSectionDetails(@Path('cid') String cId, @Path('hid') String hId);

}
