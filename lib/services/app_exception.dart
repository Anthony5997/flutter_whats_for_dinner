class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request : ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised : ");
}

class FetchDataException extends AppException {
  FetchDataException([message])
      : super(message, "Error During Communication : ");
}

class InvalidInputException extends AppException {
  InvalidInputException([message]) : super(message, "Invalid Input : ");
}
