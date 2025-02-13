import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_form_state.dart';

class UserFormCubit extends Cubit<UserFormState> {
  UserFormCubit() : super(UserFormInitial());
}
