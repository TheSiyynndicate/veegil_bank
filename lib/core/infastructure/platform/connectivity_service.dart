import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract interface class ConnectivityService {
  Future<bool> isConnected();
}

@LazySingleton(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {

  ConnectivityServiceImpl(this._connectivity);
  final Connectivity _connectivity;

  @override
  Future<bool> isConnected() async {
    final status = await _connectivity.checkConnectivity();
    final isConnected = _isConnected(status);

    return isConnected;
  }

  static bool _isConnected(ConnectivityResult status) {
    return status == ConnectivityResult.wifi ||
        status == ConnectivityResult.mobile ||
        status == ConnectivityResult.ethernet;
  }
}
