// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/register_data_sources.dart'
    as _i484;
import '../../features/auth/data/data_sources/register_data_sources_repo.dart'
    as _i988;
import '../../features/auth/data/repositories/register_repo_imp.dart' as _i1051;
import '../../features/auth/domain/repositories/register_repo.dart' as _i629;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/presentation/view_model/view_model_register/register_cubit.dart'
    as _i475;
import '../api/api_manager/api_manager.dart' as _i680;
import '../api/dio_module.dart' as _i784;

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
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.providerDio());
    gh.factory<_i680.ApiService>(() => _i680.ApiService(gh<_i361.Dio>()));
    gh.factory<_i988.RegisterDataSourcesRepo>(
        () => _i484.RegisterDataSources(gh<_i680.ApiService>()));
    gh.factory<_i629.RegisterRepo>(
        () => _i1051.RegisterRepoImp(gh<_i988.RegisterDataSourcesRepo>()));
    gh.factory<_i957.RegisterUseCase>(
        () => _i957.RegisterUseCase(gh<_i629.RegisterRepo>()));
    gh.factory<_i475.RegisterCubit>(
        () => _i475.RegisterCubit(gh<_i957.RegisterUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
