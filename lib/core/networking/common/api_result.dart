sealed class DataResult<T> {}

class Success<T> implements DataResult<T> {
  T data;

  Success(this.data);
}

class Fail<T> implements DataResult<T> {
  Exception? exception;

  Fail(this.exception);
}
