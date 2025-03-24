
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent,CheckBoxState> {
  CheckBloc() : super(CheckBoxState(curruntValue: false)) {
    on<CheckBoxEvent>((event, emit) {
      emit(CheckBoxState(curruntValue: event.value));
    });
  }
}
