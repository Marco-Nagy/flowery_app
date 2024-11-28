abstract class AppException implements Exception{
  final String message;
  const AppException ([this.message='Something went wrong!']);
}

class RemoteException extends AppException {
  const RemoteException(super.message);
}
