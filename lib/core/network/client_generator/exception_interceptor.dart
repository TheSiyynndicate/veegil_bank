import 'package:dio/dio.dart';
import 'package:veegil_bank/core/constants/exception_message_constants.dart';
import 'package:veegil_bank/core/exceptions/network_exception.dart';
import 'package:veegil_bank/core/service_locator.dart';

///Will be used to catch all errors that
///will be thrown in case of a dio error
class ExceptionInterceptor extends Interceptor {
  @override
  void onError(
      DioException err,
      ErrorInterceptorHandler handler,
      ) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionSlowInternet,
        );
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionApiException,
        );
      case DioExceptionType.badCertificate:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionBadResponse,
        );

      case DioExceptionType.badResponse:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionBadResponse,
        );

      case DioExceptionType.cancel:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionRequestCancelled,
        );

      case DioExceptionType.connectionError:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionApiException,
        );

      case DioExceptionType.unknown:
        throw NetworkException(
          exceptionMessage:
          sl<ExceptionsErrorMessagesConstants>().networkExceptionSlowInternet,
        );
    }
  }


}