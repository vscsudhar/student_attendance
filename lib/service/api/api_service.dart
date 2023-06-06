import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/boundry_model.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/students_details_model.dart';
import 'package:workspace/core/models/students_model.dart';

part 'api_service.g.dart';

@RestApi(
    // parser: Parser.FlutterCompute,
    )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'http://rubric.rrwinfo.com';
    dio.interceptors.addAll([
      _interceptorsWrapper(dio),
      PrettyDioLogger(requestBody: true)
      ]);

    return ApiService(dio);
  }

  @POST('/Accounts/Login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('/Staff/GetBoundrey')
  Future<BoundryResponse> getBoundries();

  @GET('/users?page=1')
  Future<StudentsResponse> getStudents();

  @GET('/users/{id}')
  Future<StudentsDetailsResponse> getStudentDetails(@Path('id') String id);
}

InterceptorsWrapper _interceptorsWrapper(Dio dio) {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      // print("TOKEN>>" + locator<amazonCognitoService>().getToken());

      options.headers[HttpHeaders.authorizationHeader] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3VzZXJkYXRhIjoiY29sbGVnZSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWUiOiJTdWRoYXIiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3NlcmlhbG51bWJlciI6IjEwMjAiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJUZWFjaGVyIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiJDb2xsZWdlIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvc2lkIjoiMSIsImV4cCI6MTY4NjA3OTM0OCwiaXNzIjoiSldUQXV0aGVudGljYXRpb25TZXJ2ZXIiLCJhdWQiOiJKV1RTZXJ2aWNlUG9zdG1hbkNsaWVudCJ9.N34id1JqFFDcvm2zBROBQG4d4wECy6EEL5Jtl55bngQ';
      options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
      return handler.next(options);
    },
    onResponse: (response, handler) {
      if (response.data["errorCode"] != 0) {
        return handler.reject(DioError(
          requestOptions: response.requestOptions,
          error: response.data['message'].toString(),
          type: DioErrorType.badResponse,
          response: response,
        ));
      }
      handler.next(response);
    },
    onError: (dioError, handler) async {
      // Instabug.
      if (dioError.response != null && dioError.response?.data["message"] == "The incoming token has expired") {
        // var result = await locator<AmazonCognitoService>().refreshSession();
        var result = null;
        if (result) {
          handler.resolve(
            await dio.request(
              dioError.requestOptions.uri.toString(),
              data: dioError.requestOptions.data,
              options: Options(method: dioError.requestOptions.method),
            ),
          );
        }
      } else {
        handler.next(dioError);
      }
    },
  );
}
