part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool isSwitchOn;
  final double sliderValue;
  const SwitchState({this.isSwitchOn = false, this.sliderValue = 0.5});

  @override
  List<Object> get props => [isSwitchOn, sliderValue];

  SwitchState copyWith({bool? isSwitchOn, double? sliderValue}) {
    return SwitchState(
      isSwitchOn: isSwitchOn ?? this.isSwitchOn,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }
}
