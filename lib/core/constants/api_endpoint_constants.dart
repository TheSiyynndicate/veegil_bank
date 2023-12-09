import 'package:injectable/injectable.dart';


abstract class ApiEndpointConstants{
  String get baseUrl;
  String get login;
  String get signup;
  String get transfer;
}

@LazySingleton(as: ApiEndpointConstants)
class ApiConstants implements ApiEndpointConstants{
  @override
  String get baseUrl =>  'https://bankapi.veegil.com';

  @override
  String get login => '/auth/login';

  @override
  String get signup => '/auth/signup';

  @override
  String get transfer => '/accounts/transfer';
}