import 'package:dio/dio.dart';

String errorHandler(dynamic e, {bool skipErrorAlteration = false}) {
  String error;
  switch (e.runtimeType) {
    case DioError:
      e as DioError;
      error = '${e.response?.data['message'] ?? e.message}';
      break;

    default:
      error = e.toString();
  }
  if (skipErrorAlteration) {
    return error;
  }
  return error;
}
