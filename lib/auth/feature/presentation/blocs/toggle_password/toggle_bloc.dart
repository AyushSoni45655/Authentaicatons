
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, TogglePassowrdState> {
  ToggleBloc() : super(TogglePassowrdState(isToggle: false)) {
    on<TooglePassworrdEvent>((event, emit) {
      emit(TogglePassowrdState(isToggle: !state.isToggle));
    });

  }
}
