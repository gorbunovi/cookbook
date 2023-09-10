class ServerException implements Exception {}

class CacheException implements Exception {}

class AppException implements Exception{
  final String message;
  final String prefix;
  final String url;

  AppException(this.message, this.prefix, this.url);
}

class BadRequestExeption extends AppException {
  BadRequestExeption(String message, String url)
      : super(message, 'Bad Request', url);
}

class FetchDataExeption extends AppException {
  FetchDataExeption(String message, String url)
      : super(message, 'Unable to process', url);
}

class ApiNotRespondingExeption extends AppException {
  ApiNotRespondingExeption(String message, String url)
      : super(message, 'Api not responding', url);
}
class UnAuthorizedExeption extends AppException {
  UnAuthorizedExeption(String message, String url): super(message, 'UnAuthorizedExeption request', url);
}