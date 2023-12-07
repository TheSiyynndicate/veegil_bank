import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectivityService {
  Future<bool> isConnected();
}

@Injectable(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {


  ConnectivityServiceImpl(@factoryParam this.internetConnection);

  final InternetConnection internetConnection;

  @override
  Future<bool> isConnected() async => internetConnection.hasInternetAccess;
}
