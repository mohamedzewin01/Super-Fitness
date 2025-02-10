class Result<T> {}

class Success<T> implements Result<T> {
  T data;
  Success(this.data);
}

class Fail<T> implements Result<T> {
  Exception exception;
  Fail(this.exception);
}
