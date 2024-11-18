class AppException implements Exception {
  final String? message;
  final String? details;

  AppException({required this.message, this.details});

  @override
  String toString() {
    return message?? '';
  }
}

class BadRequestException extends AppException {
  BadRequestException({String? message} )
      : super(message: message);
}
class UnauthorizedException extends AppException {
  UnauthorizedException({String? message})
      : super(message: message);
}

class NoInternetException extends AppException {
  NoInternetException({String? message})
      : super(message: message);
}

class ServerError extends AppException {
  ServerError({String? message , String? details})
      : super(message: message, details: details);
}
class ConflictException extends AppException {
  ConflictException({String? message})
      : super(message: message);
}
class NotFound extends AppException {
  NotFound({String? message})
      : super(message: message);
}

class ParsingError extends AppException {
  ParsingError({String? message})
      : super(message: message);
}

class UnknownErrorException extends AppException {
  UnknownErrorException({String? message})
      : super(message: message);
}