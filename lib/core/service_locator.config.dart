// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/authentication/data/data_sources/remote/login_user_data_source.dart'
    as _i10;
import '../features/authentication/data/data_sources/remote/signup_data_source.dart'
    as _i12;
import '../features/authentication/data/repositories/login_user_repository.dart'
    as _i14;
import '../features/authentication/data/repositories/signup_user_repository.dart'
    as _i16;
import '../features/authentication/domain/repositories/login_user_repository.dart'
    as _i13;
import '../features/authentication/domain/repositories/signup_user_repository.dart'
    as _i15;
import '../features/authentication/presentation/bloc/authentication_bloc.dart'
    as _i17;
import 'constants/api_endpoint_constants.dart' as _i3;
import 'constants/app_color_constants.dart' as _i4;
import 'constants/asset_constants.dart' as _i6;
import 'constants/exception_message_constants.dart' as _i8;
import 'constants/route_constants.dart' as _i11;
import 'infastructure/platform/connectivity_service.dart' as _i9;
import 'network/client_generator/client_generator.dart' as _i7;
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
    gh.lazySingleton<_i3.ApiEndpointConstants>(() => _i3.ApiConstants());
    gh.lazySingleton<_i4.AppColorConstants>(() => _i4.ColorConstants());
    gh.lazySingleton<_i5.AppTheme>(() => _i5.AppThemeData());
    gh.lazySingleton<_i6.AssetConstants>(() => _i6.AssetsConstants());
    gh.lazySingleton<_i7.ClientGenerator>(() => _i7.DioClient());
    gh.lazySingleton<_i8.ExceptionsErrorMessagesConstants>(
        () => _i8.ExceptionConstants());
    gh.factory<_i9.InternetChecker>(() => _i9.InternetCheckerImpl());
    gh.factory<_i10.LoginUserDataSource>(
        () => _i10.LoginUserDataSourceImpl(gh<_i7.ClientGenerator>()));
    gh.lazySingleton<_i11.RouteConstants>(() => _i11.RouteConstantsData());
    gh.factory<_i12.SignupDataSource>(
        () => _i12.SignupDataSourceImpl(gh<_i7.ClientGenerator>()));
    gh.factory<_i9.ConnectivityService>(
        () => _i9.ConnectivityServiceImpl(gh<_i9.InternetChecker>()));
    gh.factory<_i13.LoginUserRepository>(() => _i14.LoginUserRepositoryImpl(
          gh<_i10.LoginUserDataSource>(),
          gh<_i9.ConnectivityService>(),
        ));
    gh.factory<_i15.SignupUserRepository>(() => _i16.SignupUserRepositoryImpl(
          gh<_i9.ConnectivityService>(),
          gh<_i12.SignupDataSource>(),
        ));
    gh.singleton<_i17.AuthenticationBloc>(_i17.AuthenticationBloc(
      gh<_i15.SignupUserRepository>(),
      gh<_i13.LoginUserRepository>(),
    ));
    return this;
  }
}
