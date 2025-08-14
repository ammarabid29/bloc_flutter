part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counterValue;
  const CounterState({this.counterValue = 0});

  @override
  List<Object> get props => [counterValue];

  CounterState copyWith({int? counterValue}) {
    return CounterState(counterValue: counterValue ?? this.counterValue);
  }
}
