import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<ToggleNotificationsEvent>(_toggleNotifications);
    on<SliderEvent>(_sliderChanged);
  }

  void _toggleNotifications(
    ToggleNotificationsEvent event,
    Emitter<SwitchState> emit,
  ) {
    final currentState = state;
    emit(currentState.copyWith(isSwitchOn: !currentState.isSwitchOn));
  }

  void _sliderChanged(SliderEvent event, Emitter<SwitchState> emit) {
    final currentState = state;
    emit(currentState.copyWith(sliderValue: event.sliderValue));
  }
}
