///The exception that will be thrown should an authentication
///error occur. To be handled on UI by letting the user know
///the status of their authentication attempt. Either login or
///registration
class AuthenticationException implements Exception {
  ///Default constructor, will contain the error message
  AuthenticationException({required this.exceptionMessage});

  ///The message to be shown
  final String? exceptionMessage;

  @override
  String toString() => exceptionMessage!;
}