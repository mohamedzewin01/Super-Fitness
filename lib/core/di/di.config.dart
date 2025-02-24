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

import '../../features/auth/data/data_sources/auth_online_data_source.dart'
    as _i994;
import '../../features/auth/data/data_sources/auth_online_data_source_impl.dart'
    as _i140;
import '../../features/auth/data/data_sources/forget_password_data_source_files/forget_password_data_source.dart'
    as _i35;
import '../../features/auth/data/data_sources/forget_password_data_source_files/forget_password_data_source_impl.dart'
    as _i349;
import '../../features/auth/data/data_sources/register_data_sources.dart'
    as _i484;
import '../../features/auth/data/data_sources/register_data_sources_repo.dart'
    as _i988;
import '../../features/auth/data/repositories/forget_password_repo_impl.dart'
    as _i327;
import '../../features/auth/data/repositories/login_repo_impl.dart' as _i886;
import '../../features/auth/data/repositories/register_repo_imp.dart' as _i1051;
import '../../features/auth/domain/repositories/forget_password_repo.dart'
    as _i786;
import '../../features/auth/domain/repositories/login_repo.dart' as _i502;
import '../../features/auth/domain/repositories/register_repo.dart' as _i629;
import '../../features/auth/domain/use_cases/forget_password_use_case.dart'
    as _i483;
import '../../features/auth/domain/use_cases/login_use_case.dart' as _i1038;
import '../../features/auth/domain/use_cases/logout_usecase.dart' as _i844;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/domain/use_cases/reset_password_usecase.dart'
    as _i348;
import '../../features/auth/domain/use_cases/verify_uce_case.dart' as _i148;
import '../../features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart'
    as _i1043;
import '../../features/auth/presentation/view_model/login_view_model/login_cubit.dart'
    as _i925;
import '../../features/auth/presentation/view_model/logout_view_model/logout_view_model.dart'
    as _i334;
import '../../features/auth/presentation/view_model/reset_password_view_model/reset_password_cubit.dart'
    as _i609;
import '../../features/auth/presentation/view_model/verify_password_view_model/verify_password_cubit.dart'
    as _i1002;
import '../../features/auth/presentation/view_model/view_model_register/register_cubit.dart'
    as _i475;
import '../../features/edit_profile/data/data_sources/edit_profile_datasources.dart'
    as _i950;
import '../../features/edit_profile/data/repositories/edit_profile_repo_impl.dart'
    as _i960;
import '../../features/edit_profile/domain/repositories/edit_profile_repo.dart'
    as _i164;
import '../../features/edit_profile/domain/use_cases/edit_profile_useCase.dart'
    as _i541;
import '../../features/edit_profile/presentation/manager/edit_profile_cubit.dart'
    as _i936;
import '../../features/profile/data/data_sources/profile_online_data_source.dart'
    as _i99;
import '../../features/profile/data/data_sources/profile_online_data_source_impl.dart'
    as _i797;
import '../../features/profile/data/repositories/profile_repo_impl.dart'
    as _i988;
import '../../features/profile/domain/repositories/profile_repo.dart' as _i790;
import '../../features/profile/domain/use_cases/profile_use_cases.dart'
    as _i995;
import '../../features/profile/presentation/cubit/profile_view_model.dart'
    as _i516;
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
    gh.factory<_i950.EditProfileDataSource>(
        () => _i950.EditProfileDataSource(gh<_i680.ApiService>()));
    gh.factory<_i988.RegisterDataSourcesRepo>(
        () => _i484.RegisterDataSources(gh<_i680.ApiService>()));
    gh.factory<_i629.RegisterRepo>(
        () => _i1051.RegisterRepoImp(gh<_i988.RegisterDataSourcesRepo>()));
    gh.factory<_i35.ForgetPasswordDataSource>(
        () => _i349.ForgetPasswordDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i994.AuthOnlineDataSource>(
        () => _i140.AuthOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i99.ProfileOnlineDataSource>(
        () => _i797.ProfileOnlineDataSourceImpl(gh<_i680.ApiService>()));
    gh.factory<_i164.EditProfileRepo>(
        () => _i960.EditProfileRepoImpl(gh<_i950.EditProfileDataSource>()));
    gh.factory<_i502.AuthRepo>(
        () => _i886.AuthRepoImpl(gh<_i994.AuthOnlineDataSource>()));
    gh.factory<_i786.ForgetPasswordRepo>(() =>
        _i327.ForgetPasswordRepoImpl(gh<_i35.ForgetPasswordDataSource>()));
    gh.factory<_i957.RegisterUseCase>(
        () => _i957.RegisterUseCase(gh<_i629.RegisterRepo>()));
    gh.factory<_i1038.LoginUseCases>(
        () => _i1038.LoginUseCases(gh<_i502.AuthRepo>()));
    gh.factory<_i844.LogoutUseCases>(
        () => _i844.LogoutUseCases(gh<_i502.AuthRepo>()));
    gh.factory<_i790.ProfileRepo>(
        () => _i988.ProfileRepoImpl(gh<_i99.ProfileOnlineDataSource>()));
    gh.factory<_i475.RegisterCubit>(
        () => _i475.RegisterCubit(gh<_i957.RegisterUseCase>()));
    gh.factory<_i541.EditProfileUseCase>(
        () => _i541.EditProfileUseCase(gh<_i164.EditProfileRepo>()));
    gh.factory<_i334.LogoutViewModel>(
        () => _i334.LogoutViewModel(gh<_i844.LogoutUseCases>()));
    gh.factory<_i995.ProfileUseCases>(
        () => _i995.ProfileUseCases(gh<_i790.ProfileRepo>()));
    gh.factory<_i483.ForgetPasswordUseCase>(
        () => _i483.ForgetPasswordUseCase(gh<_i786.ForgetPasswordRepo>()));
    gh.factory<_i348.ResetPasswordUseCase>(
        () => _i348.ResetPasswordUseCase(gh<_i786.ForgetPasswordRepo>()));
    gh.factory<_i148.VerifyUseCase>(
        () => _i148.VerifyUseCase(gh<_i786.ForgetPasswordRepo>()));
    gh.factory<_i1043.ForgetPasswordViewModel>(() =>
        _i1043.ForgetPasswordViewModel(gh<_i483.ForgetPasswordUseCase>()));
    gh.factory<_i609.ResetPasswordViewModel>(
        () => _i609.ResetPasswordViewModel(gh<_i348.ResetPasswordUseCase>()));
    gh.factory<_i516.ProfileViewModel>(
        () => _i516.ProfileViewModel(gh<_i995.ProfileUseCases>()));
    gh.factory<_i925.LoginViewModel>(
        () => _i925.LoginViewModel(gh<_i1038.LoginUseCases>()));
    gh.factory<_i936.EditProfileCubit>(
        () => _i936.EditProfileCubit(gh<_i541.EditProfileUseCase>()));
    gh.factory<_i1002.VerifyPasswordViewModel>(
        () => _i1002.VerifyPasswordViewModel(gh<_i148.VerifyUseCase>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
