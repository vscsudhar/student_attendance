import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:workspace/core/models/login_model.dart';
import 'package:workspace/core/models/students_model.dart';

part 'api_service.g.dart';

@RestApi(
    // parser: Parser.FlutterCompute,
    )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService init() {
    final dio = Dio();
    dio.options.baseUrl = 'https://reqres.in/api';
    dio.interceptors.addAll([PrettyDioLogger(requestBody: true)]);

    return ApiService(dio);
  }

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @GET('/users?page=1')
  Future<StudentsResponse> getStudents();
}
