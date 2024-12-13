import 'dart:io';

import 'package:dio/dio.dart';

import '../../provider/localization_helper.dart';
import 'error_model.dart';

class ErrorHandler {
  final String errorMessage;

  ErrorHandler(this.errorMessage);

  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      return ErrorHandler.networkError(error, error.response?.statusCode);
    } else if (error is IOException) {
      return ErrorModel(
          error: LocalizationHelper.localizations.no_internet_connection);
    } else {
      return ErrorModel(
          error: LocalizationHelper.localizations.unknown_error);
    }
  }

  static ErrorModel serverError(int? statusCode, ErrorModel response) {
    switch (statusCode) {
      case 400:
        return ErrorModel(
            error: LocalizationHelper.localizations.bad_request_error);
      case 401:
      case 403:
      case 404:
        return ErrorModel(
            error: response.error ??
                LocalizationHelper.localizations.unauthorized_access);
      case 408:
        return ErrorModel(
            error: LocalizationHelper.localizations.connection_timed_out);
      case 409:
        return ErrorModel(error: response.error ?? LocalizationHelper.localizations.unauthorized_access);
      default:
        return ErrorModel(
            error: LocalizationHelper.localizations.unexpected_error);
    }
  }

  static ErrorModel networkError(DioException error, int? statusCode) {
    switch (statusCode) {
      case 500:
        return  ErrorModel(
            error: LocalizationHelper.localizations.internal_server_error);
      case 502:
        return  ErrorModel(
            error: LocalizationHelper.localizations.bad_gateway_error);
      case 503:
        return  ErrorModel(
       error: LocalizationHelper.localizations.service_unavailable_error);

      case 504:
        return  ErrorModel(
             error: LocalizationHelper.localizations.gateway_timeout_error);
      default:
      // Ensure we convert response data to ErrorModel
        if (error.response?.data is Map<String, dynamic>) {
          final errorModel = ErrorModel.fromMap(error.response!.data as Map<String, dynamic>);
          return ErrorHandler.serverError(error.response?.statusCode, errorModel);
        }
        return  ErrorModel(
            error: LocalizationHelper.localizations.unexpected_error);
    }
  }
}




