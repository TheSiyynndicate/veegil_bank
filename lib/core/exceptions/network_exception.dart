///The exception that will be thrown should a network
///error occur. To be handled on UI by letting the user know
///the status of their internet. Either bad network or
///no network
class NetworkException implements Exception {
  ///Default constructor, will contain the error message
  NetworkException({required this.exceptionMessage});

  ///The message to be shown
  final String exceptionMessage;

  @override
  String toString() => exceptionMessage;
}