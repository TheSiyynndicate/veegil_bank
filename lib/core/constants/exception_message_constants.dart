import 'package:injectable/injectable.dart';

///Will contain all possible error messages
///for this project
///each variable should be name after the exception it
///was created for.
abstract class ExceptionsErrorMessagesConstants {
  ///for NetworkException
  String get networkExceptionSlowInternet;


  ///for NetworkException
  String get networkExceptionNoInternet;

  ///for NetworkException
  String get networkExceptionApiException;

  ///for NetworkException
  String get networkExceptionUnknown;

  ///for NetworkException
  String get networkExceptionRequestCancelled;

  ///for NetworkException
  String get networkExceptionBadResponse;

  ///for AuthenticationException
  ///A general message for a failed login attempt
  ///When the specific error wasn't detected
  String get authenticationExceptionLoginAttemptFailed;

  /// for AuthenticationException
  String get authenticationExceptionInvalidCredentials;

  /// for AuthenticationException
  String get authenticationExceptionInvalidSignupData;

  /// for AuthenticationException
  String get authenticationExceptionAlreadyRegistered;
}

@LazySingleton(as: ExceptionsErrorMessagesConstants)
class ExceptionConstants implements  ExceptionsErrorMessagesConstants{
  @override
  String get networkExceptionSlowInternet =>
      'You have a slow Internet connection';

  @override
  String get networkExceptionNoInternet => 'You have no Internet connection';

  @override
  String get networkExceptionApiException =>
      'Our servers are having issues processing the '
      'request at the moment. Please try again';

  @override
  String get networkExceptionUnknown => 'An error occurred.';

  @override
  String get networkExceptionRequestCancelled => 'Request cancelled.';

  @override
  String get networkExceptionBadResponse => 'Unexpected response.';

  @override
  String get authenticationExceptionInvalidCredentials => 'Invalid credentials';

  @override
  String get authenticationExceptionLoginAttemptFailed =>
      'Login attempt failed. Please try again.';

  @override
  String get authenticationExceptionInvalidSignupData =>
      'All signup data fields must be valid';

  @override
  String get authenticationExceptionAlreadyRegistered =>
      'The user already exists';
}
