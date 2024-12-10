import 'dart:io';

import 'package:dio/dio.dart';

import 'error_model.dart';

class ErrorHandler {
  final String errorMessage;

  ErrorHandler(this.errorMessage);

  // Handle the exception and return an ErrorModel
  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      return ErrorHandler.networkError(error, error.response?.statusCode);
    } else if (error is IOException) {
      return const ErrorModel(
          error: "No internet connection. Please check your settings.");
    } else {
      return const ErrorModel(error: "An unknown error occurred. Please try again.");
    }
  }

  // This method should return ErrorModel, not ErrorHandler
  static ErrorModel serverError(int? statusCode, ErrorModel response) {
    switch (statusCode) {
      case 400:
        return const ErrorModel(
            error: "Bad request. Please verify your input and try again.");
      case 401:
      case 402:
      case 403:
      case 404:
        return ErrorModel(error: response.error ?? 'Unauthorized access');
      case 408:
        return const ErrorModel(
            error:
            "Connection timed out. Please check your internet connection.");
      case 409:
        return ErrorModel(error: response.error ?? 'Unauthorized access');
      default:
        return const ErrorModel(
            error: "An unexpected error occurred. Please try again.");
    }
  }

  static ErrorModel networkError(DioException error, int? statusCode) {
    switch (statusCode) {
      case 500:
        return const ErrorModel(
            error: "Internal server error. Please try again later.");
      case 502:
        return const ErrorModel(
            error: "Bad Gateway. The server received an invalid response.");
      case 503:
        return const ErrorModel(
            error:
            "Service Unavailable. The server is currently unable to handle the request.");
      case 504:
        return const ErrorModel(
            error: "Gateway Timeout. The server took too long to respond.");
      default:
      // Ensure we convert response data to ErrorModel
        if (error.response?.data is Map<String, dynamic>) {
          final errorModel = ErrorModel.fromMap(error.response!.data as Map<String, dynamic>);
          return ErrorHandler.serverError(error.response?.statusCode, errorModel);
        }
        return const ErrorModel(
            error: "An unexpected error occurred. Please try again.");
    }
  }
}
