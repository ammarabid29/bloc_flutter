part of 'switch_bloc.dart';

sealed class SwitchEvent extends Equatable {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class ToggleNotificationsEvent extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  final double sliderValue;

  const SliderEvent({required this.sliderValue});

  @override
  List<Object> get props => [sliderValue];
}
