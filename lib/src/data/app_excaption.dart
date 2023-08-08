
class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message,this._prefix]);

  String toString(){
    return '$_prefix $_message';
  }

}

//==========Exception 1===========

class FetchDataException extends AppException{

  FetchDataException([String? message]) : super(message,'Error During communication');
}

//==========Exception 2 ===========

class BadRequestException extends AppException{

  BadRequestException([String? message]) : super(message,'Invalid request');
}

//==========Exception 3 ===========

class UnauthorisedException extends AppException{

  UnauthorisedException([String? message]) : super(message,' Unauthorised request');
}


//==========Exception 4 ===========

class InvalidInputException extends AppException{

  InvalidInputException([String? message]) : super(message,' Invalid Input request');
}