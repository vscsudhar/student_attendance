import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/boundry_model.dart';
import 'package:workspace/core/models/login_model.dart';
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
    dio.options;
    dio.interceptors.addAll([_interceptorsWrapper(dio), PrettyDioLogger(requestBody: true)]);

    return ApiService(dio);
  }

  @POST('/Accounts/Login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('/Staff/GetBoundry')
  Future<BoundryResponse> getBoundries();

  @GET('/users?page=1')
  Future<StudentsResponse> getStudents();

  @GET('/users/{id}')
  Future<StudentsDetailsResponse> getStudentDetails(@Path('id') String id);
}

InterceptorsWrapper _interceptorsWrapper(Dio dio) {
  RequestOptions options = RequestOptions(headers: {"Authorization": "Bearer ${locator<UserAuthenticationService>().token}", "accept": "application/json"});
  return InterceptorsWrapper(
    // onRequest: (options, handler) {
    //   print("TOKEN>>" + locator<UserAuthenticationService>().token);
    //   //options.headers["Authorization"] = "Bearer " + accessToken.toString();
    //   // options.headers[HttpHeaders.authorizationHeader] = "Bearer ${locator<UserAuthenticationService>().token}";
    //   // options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    //   return handler.next(options);
    // },
    onRequest: (RequestOptions requestOptions, RequestInterceptorHandler handler) {
      requestOptions.headers.putIfAbsent('Authorization', () => 'Bearer ${locator<UserAuthenticationService>().token}');
      handler.next(requestOptions);
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
        var result;
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
