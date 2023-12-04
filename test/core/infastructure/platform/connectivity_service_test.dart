import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:veegil_bank/core/infastructure/platform/connectivity_service.dart';

import 'connectivity_service_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Connectivity>()])
void main() {
  late MockConnectivity mockConnectivity;
  late ConnectivityServiceImpl connectivityServiceImpl;

  setUp(() {
    mockConnectivity = MockConnectivity();
    connectivityServiceImpl = ConnectivityServiceImpl(mockConnectivity);
  });
  group('isConnected', () {
    test('should return true when mobile data is turned on', () async {
      /// arrange
      const tHasConnection = true;
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.mobile);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockConnectivity.checkConnectivity());
      expect(result, tHasConnection);
    });
    test('should return false when mobile data is turned off', () async {
      /// arrange
      const tHasConnection = false;
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.none);

      /// act
      final result = await connectivityServiceImpl.isConnected();

      /// assert
      verify(mockConnectivity.checkConnectivity());
      expect(result, tHasConnection);
    });
  });
}
