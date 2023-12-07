import 'package:injectable/injectable.dart';

abstract class RouteConstants {
   String get authenticationPage;

  String get dashboardPage;
}

@LazySingleton(as: RouteConstants)
class RouteConstantsData implements RouteConstants {
  @override
  String get authenticationPage =>   '/AuthenticationPage';

  @override
  String get dashboardPage => '/DashboardPage';
}
