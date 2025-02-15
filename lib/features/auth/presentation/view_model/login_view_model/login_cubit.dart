import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:super_fitness/features/auth/domain/entities/login_entity.dart';

import '../../../../../core/common/api_result.dart';
import '../../../../../core/utils/cashed_data_shared_preferences.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_state.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  final LoginUseCases loginUseCases;

  LoginViewModel(this.loginUseCases) : super(InitialState());

  Future<void> login(String email,
      String password) async {
    emit(LoadingLoginState());

    var result = await loginUseCases.login(email, password);

    switch (result) {
      case Success<LoginResponseEntity>():
        await _saveToken(result.data.token!);
        // print("===========================================");
        // print(result.data.token);
        // print("===========================================");
        // print(StringCache.userToken);
        await _saveToken(result.data.token!);
        emit(SuccessLoginState(result.data));
      case Fail<LoginResponseEntity>():
        emit(ErrorLoginState(result.exception));
    }
  }

  Future<void> _saveToken(String token) async {
    await CacheService.setData(key: CacheConstants.userToken, value: token);
  }

}
