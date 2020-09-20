class ApplicationError implements Exception{
final ErrorType type;
final String errorMsg;
final String errorMsgKey;
final dynamic extra;

  ApplicationError({this.type, this.errorMsg, this.errorMsgKey, this.extra});
}

class ErrorType{}

class NetworkError extends ErrorType{
  final int code;

  NetworkError(this.code);
}

class Unauthorized extends NetworkError{
  Unauthorized() : super(401);
}

class ResourceNotFound extends NetworkError{
  ResourceNotFound() : super(404);
}

class UnExpected extends NetworkError{
  UnExpected() : super(-1);
}