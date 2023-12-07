// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i8;

import 'constants/api_endpoint_constants.dart' as _i3;
import 'constants/app_color_constants.dart' as _i4;
import 'constants/asset_constants.dart' as _i6;
import 'constants/exception_message_constants.dart' as _i10;
import 'infastructure/platform/connectivity_service.dart' as _i7;
import 'network/client_generator/client_generator.dart' as _i9;
import 'presentation/theme/app_theme.dart' as _i5;

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
    gh.lazySingleton<_i4.AppColorConstants>(() => _i4.ColorConstants());
    gh.lazySingleton<_i5.AppTheme>(() => _i5.AppThemeData());
    gh.lazySingleton<_i6.AssetConstants>(() => _i6.AssetsConstants());
    gh.factoryParam<_i7.ConnectivityService, _i8.InternetConnection, dynamic>((
      internetConnection,
      _,
    ) =>
        _i7.ConnectivityServiceImpl(internetConnection));
    gh.lazySingleton<_i9.DioClient>(
        () => _i9.DioClient(headers: gh<Map<String, dynamic>>()));
    gh.lazySingleton<_i10.ExceptionConstants>(() => _i10.ExceptionConstants());
    return this;
  }
}
