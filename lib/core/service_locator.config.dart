// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'constants/api_endpoint_constants.dart' as _i3;
import 'constants/exception_message_constants.dart' as _i7;
import 'infastructure/platform/connectivity_service.dart' as _i4;
import 'network/client_generator/client_generator.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiConstants>(() => _i3.ApiConstants());
    gh.lazySingleton<_i4.ConnectivityService>(
        () => _i4.ConnectivityServiceImpl(gh<_i5.Connectivity>()));
    gh.lazySingleton<_i6.DioClient>(
        () => _i6.DioClient(headers: gh<Map<String, dynamic>>()));
    gh.lazySingleton<_i7.ExceptionConstants>(() => _i7.ExceptionConstants());
    return this;
  }
}
