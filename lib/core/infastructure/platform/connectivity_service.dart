import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';



abstract interface class ConnectivityService {
  Future<bool> isConnected();
}

@Injectable(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {


  ConnectivityServiceImpl(this.internetChecker);

  final InternetChecker internetChecker;

  @override
  Future<bool> isConnected() async => internetChecker.isInternetAvailable();
}

abstract class InternetChecker{
  Future<bool> isInternetAvailable();
}

@Injectable(as: InternetChecker)
class InternetCheckerImpl implements InternetChecker{
  @override
  Future<bool> isInternetAvailable() => InternetConnection().hasInternetAccess;
}