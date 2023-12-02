import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:veegil_bank/features/authentication/data/models/signup_user_model.dart';
import 'package:veegil_bank/features/authentication/domain/entities/signup_user_entity.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tSignupUserModel = SignupUserModel(
      status: 'success',
      message: 'Signup successful',
      data: DataModel(
          phoneNumber: '+2349012345678', created: '2023-12-02T13:32:35.436Z'));

  test('should be a subclass of [SignupUserEntity]', () async {
    expect(tSignupUserModel, isA<SignupUserEntity>());
  });

  group('fromJson', () {
    test('should return data of type [LoginUserEntity]', () async {
      /// arrange
      final jsonMap =
          json.decode(fixture('signup.json')) as Map<String, dynamic>;

      /// act
      final result = SignupUserModel.fromJson(jsonMap);

      /// assert
      expect(result, tSignupUserModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the matching data', () async {
      /// arrange
      final result = tSignupUserModel.toJson();
      final expectedMap = <String, dynamic>{
        'status': 'success',
        'message': 'Signup successful',
        'data': {
          'phoneNumber': '+2349012345678',
          'created': '2023-12-02T13:32:35.436Z'
        }
      };

      /// assert
      expect(result, expectedMap);
    });
  });
}
