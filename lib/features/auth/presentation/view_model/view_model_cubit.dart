import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'view_model_state.dart';

class ViewModelCubit extends Cubit<ViewModelState> {
  ViewModelCubit() : super(ViewModelInitial());
}
