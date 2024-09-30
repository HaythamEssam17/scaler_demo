import 'package:dio/dio.dart';
import 'package:scalers_demo/core/helpers/shared.dart';

class TracApiCallsInterceptor extends Interceptor {
  final Dio dio;

  TracApiCallsInterceptor(this.dio);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    devLog('onRequest[${options.method}] => PATH: ${options.path}');
    devLog('onRequest Headers: ${options.headers}');
    devLog('onRequest Data: ${options.data}');
    return handler.next(options); // continue
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    devLog('onResponse[${response.statusCode}] => DATA: ${response.data}');
    return handler.next(response); // continue
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    devLog('Error[${err.response?.statusCode}] => MESSAGE: ${err.message}');
    return handler.next(err); //continue
  }
}
