// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/networking/api/api_manager.dart' as _i282;
import '../core/networking/common/regestet_context_module.dart' as _i125;
import '../core/networking/network_factory.dart' as _i377;
import '../features/auth/login/data/data_sources/contracts/auth_online_data_source.dart'
    as _i739;
import '../features/auth/login/data/data_sources/contracts/offline_data_source.dart'
    as _i239;
import '../features/auth/login/data/data_sources/impl/auth_offline_data_source_impl.dart'
    as _i1009;
import '../features/auth/login/data/data_sources/impl/auth_online_data_source_impl.dart'
    as _i250;
import '../features/auth/login/data/repositories/auth_repo_impl.dart' as _i379;
import '../features/auth/login/domain/contracts/auth_repo.dart' as _i816;
import '../features/auth/login/domain/use_cases/auth_use_case.dart' as _i268;
import '../features/auth/login/presentation/viewModel/login_view_model_cubit.dart'
    as _i352;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkFactory = _$NetworkFactory();
    final registerModule = _$RegisterModule();
    gh.factory<_i361.LogInterceptor>(
        () => networkFactory.providerInterceptor());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i361.Dio>(() => networkFactory.provideDio());
    gh.singleton<_i282.ApiManager>(() => _i282.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i239.OfflineDataSource>(
        () => _i1009.OfflineDataSourceImplementation());
    gh.factory<_i739.AuthOnlineDataSource>(
        () => _i250.AuthOnlineDataSourceImpl(gh<_i282.ApiManager>()));
    gh.factory<_i816.AuthRepository>(
        () => _i379.AuthRepositoryImpl(gh<_i739.AuthOnlineDataSource>()));
    gh.factory<_i268.AuthUseCase>(
        () => _i268.AuthUseCase(gh<_i816.AuthRepository>()));
    gh.factory<_i352.LoginViewModel>(
        () => _i352.LoginViewModel(gh<_i268.AuthUseCase>()));
    return this;
  }
}

class _$NetworkFactory extends _i377.NetworkFactory {}

class _$RegisterModule extends _i125.RegisterModule {}
