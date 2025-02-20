import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/login_entity.dart';

import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;

  LoginViewModel(this.loginUseCases) : super(InitialState());

  Future<void> login(String email, String password) async {
    emit(LoadingLoginState());

    var result = await loginUseCases.login(email, password);

    switch (result) {
      case Success<LoginResponseEntity>():
        await CacheService.setData(key: CacheConstants.userToken, value: result.data.token);
        await CacheService.setData(key: CacheConstants.userEmail, value: result.data.user?.email);
        await CacheService.setData(key: CacheConstants.userFirstName, value: result.data.user?.firstName);
        await CacheService.setData(key: CacheConstants.userLastName, value: result.data.user?.lastName);
        await CacheService.setData(key: CacheConstants.weight, value: result.data.user?.weight);
        await CacheService.setData(key: CacheConstants.activityLevel, value: result.data.user?.activityLevel);
        await CacheService.setData(key: CacheConstants.goal, value: result.data.user?.goal);
        emit(SuccessLoginState(result.data));
      case Fail<LoginResponseEntity>():
        emit(ErrorLoginState(result.exception));
    }
  }


}
