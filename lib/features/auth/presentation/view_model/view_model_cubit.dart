import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_model_state.dart';

class ViewModelCubit extends Cubit<ViewModelState> {
  ViewModelCubit() : super(ViewModelInitial());

  int currentIndicator = 0;
  bool isMale = false;

  void changeIndicator(int index) {
    currentIndicator = index;
    emit(IndicatorChanged());
  }
  void changeGender(bool gender) {
    isMale = gender;
    emit(GenderChanged());
  }

}
