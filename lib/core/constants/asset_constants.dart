import 'package:injectable/injectable.dart';

abstract class AssetConstants {
  ///Visual art for the [LoginWidget]
  String get login;

  ///Visual art for the [SignupWidget]
  String get signup;
}

@LazySingleton(as: AssetConstants)
class AssetsConstants implements AssetConstants {
  @override
  String get login => 'assets/images/login.png';

  @override
  String get signup => 'assets/images/signup.png';
}
