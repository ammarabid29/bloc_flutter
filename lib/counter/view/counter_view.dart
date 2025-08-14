import 'package:bloc_flutter/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // only this will be rebuild when the state changes
          // BlocBuilder listens to the CounterBloc and rebuilds when the state changes
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.counterValue.toString(),
                  style: TextStyle(fontSize: 60),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                child: Text("Increment"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                },
                child: Text("Decrement"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
