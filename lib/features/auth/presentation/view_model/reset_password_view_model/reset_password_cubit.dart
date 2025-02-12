import 'package:bloc/bloc.dart';
import '../../../domain/entities/forget_password_entities/reset_password_entity.dart';
import '../../../domain/use_cases/reset_password_usecase.dart';
import 'reset_password_state.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/api_result.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordViewModel(this.resetPasswordUseCase) : super(InitialState());

  void doIntent(ResetPasswordScreenIntent intent) {
    switch (intent) {
      case ResetPasswordIntent():
        _resetPassword(intent);
    }
  }

  void _resetPassword(ResetPasswordIntent intent) async {
    emit(LoadingResetPasswordState());

    var result =
        await resetPasswordUseCase.invoke(intent.email, intent.newPassword);
    switch (result) {
      case Success<ResetPasswordEntity?>():
        emit(SuccessResetPasswordState(result.data));
      case Fail<ResetPasswordEntity?>():
        emit(ErrorResetPasswordState(result.exception));
    }
  }
}

sealed class ResetPasswordScreenIntent {}

class ResetPasswordIntent extends ResetPasswordScreenIntent {
  String email;
  String newPassword;

  ResetPasswordIntent(this.email, this.newPassword);
}
