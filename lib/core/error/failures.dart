// import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

class Failure {
  final String message;
  final int code;
  final http.Response? baseRepsonse;
  final dynamic error;

  Failure(
      {required this.message,
      required this.code,
      this.baseRepsonse,
      this.error});
}

class NetWorkException extends Failure {
  NetWorkException({required String message, required int code, baseResponse})
      : super(code: code, message: message, baseRepsonse: baseResponse);
}

class ServerException extends Failure {
  final int code;

  ServerException(
      {required String message, this.code = 500, baseResponse, error})
      : super(
            message: message,
            code: code,
            baseRepsonse: baseResponse,
            error: error);
}
