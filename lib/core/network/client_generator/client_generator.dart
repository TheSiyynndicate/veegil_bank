import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:veegil_bank/core/constants/api_endpoint_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';

abstract class ClientGenerator {
  Future<Response<dynamic>?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<dynamic>?> post(
    String endpoint, {
    Map<String, dynamic>? requestBody,
    Map<String, dynamic>? headers,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

///Used to make network request
///and receive response
@LazySingleton(as: ClientGenerator)
class DioClient implements ClientGenerator {
  /// injecting dio instance
  @factoryMethod
  DioClient();

  /// [dio] instance
  Dio dio = Dio(BaseOptions(
    baseUrl: sl<ApiEndpointConstants>().baseUrl,
    connectTimeout: const Duration(seconds: 10),
  ))
    // ..interceptors.add(ExceptionInterceptor())
    ..interceptors.add(PrettyDioLogger(
        requestBody: true, responseHeader: true, requestHeader: true));

  /// Get:---------------------------------------------------------------------
  @override
  Future<Response<dynamic>?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await dio.get<dynamic>(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  @override
  Future<Response?> post(String endpoint,
      {Map<String, dynamic>? requestBody,
      Map<String, dynamic>? headers,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {

      dio.options.headers = headers;

    final response = await dio.post<dynamic>(
      endpoint,
      data: requestBody,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return response;



  }
}
