class Failure {
  final String message;

  const Failure(this.message);
}

class RemoteFailure extends Failure {
  const RemoteFailure(super.message);
}
