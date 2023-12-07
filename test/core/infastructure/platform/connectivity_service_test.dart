
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';

import 'connectivity_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetConnection>()])
void main() {
  late MockInternetConnection mockInternetConnection;
  late ConnectivityServiceImpl connectivityServiceImpl;

  setUp(() {
    mockInternetConnection = MockInternetConnection();
    connectivityServiceImpl = ConnectivityServiceImpl(mockInternetConnection);
  });
  group('isConnected', () {
    test('should return true when mobile data is turned on', () async {
      /// arrange
      const tHasConnection = true;
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((realInvocation) async => true);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, tHasConnection);
    });
    test('should return false when mobile data is turned off', () async {
      /// arrange
      const tHasConnection = false;
      when(mockInternetConnection.hasInternetAccess)
          .thenAnswer((realInvocation) async => false);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockInternetConnection.hasInternetAccess);
      expect(result, tHasConnection);
    });
  });
}
