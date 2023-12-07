
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';

import 'connectivity_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<InternetChecker>()])
void main() {
  late MockInternetChecker mockInternetChecker;
  late ConnectivityServiceImpl connectivityServiceImpl;

  setUp(() {
    mockInternetChecker = MockInternetChecker();
    connectivityServiceImpl = ConnectivityServiceImpl(mockInternetChecker);
  });
  group('isConnected', () {
    test('should return true when mobile data is turned on', () async {
      /// arrange
      const tHasConnection = true;
      when(mockInternetChecker.isInternetAvailable())
          .thenAnswer((realInvocation) async => true);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockInternetChecker.isInternetAvailable());
      expect(result, tHasConnection);
    });
    test('should return false when mobile data is turned off', () async {
      /// arrange
      const tHasConnection = false;
      when(mockInternetChecker.isInternetAvailable())
          .thenAnswer((realInvocation) async => false);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockInternetChecker.isInternetAvailable());
      expect(result, tHasConnection);
    });
  });
}
