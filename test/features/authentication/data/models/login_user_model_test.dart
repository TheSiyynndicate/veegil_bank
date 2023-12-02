import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:veegil_bank/features/authentication/data/models/login_user_model.dart';
import 'package:veegil_bank/features/authentication/domain/entities/login_user_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tLoginUserModel = LoginUserModel(
      status: 'success',
      message: 'Login successful',
      data: DataModel(token: 'dummy.veegil.token'));

  test('should be a subclass of [LoginUserEntity]', () async {
    expect(tLoginUserModel, isA<LoginUserEntity>());
  });

  group('fromJson', () {
    test('should return data of type [LoginUserEntity]', () async {
      /// arrange
      final jsonMap =
          json.decode(fixture('login.json')) as Map<String, dynamic>;

      /// act
      final result = LoginUserModel.fromJson(jsonMap);

      /// assert
      expect(result, tLoginUserModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the matching data', () async {
      /// arrange
      final result = tLoginUserModel.toJson();
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'message': 'Login successful',
        'data': {'token': 'dummy.veegil.token'}
      };

      /// assert
      expect(result, expectedMap);
    });
  });
}
