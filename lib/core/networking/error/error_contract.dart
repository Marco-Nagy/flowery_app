
import 'error_model.dart';

sealed class ErrorContract implements Exception{
}

class NetworkException implements ErrorContract{
Exception exception;
NetworkException({required this.exception});
}
class ServerException implements ErrorContract{
  ErrorModel errorModel;

  ServerException(this.errorModel);
}
class NoInternetError implements ErrorContract{}
class IOExceptionError implements ErrorContract{}
class SocketExceptionError implements ErrorContract{}
class TimeoutExceptionError implements ErrorContract{}
class FormatExceptionError implements ErrorContract{}
class UnknownError implements ErrorContract{}
