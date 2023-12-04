import 'package:injectable/injectable.dart';


abstract class ApiEndpointConstants{
  String get baseUrl;
  String get login;
  String get signup;
}

@LazySingleton()
class ApiConstants implements ApiEndpointConstants{
  @override
  String get baseUrl =>  'https://bankapi.veegil.com';

  @override
  String get login => '/auth/login';

  @override
  String get signup => '/auth/signup';
}