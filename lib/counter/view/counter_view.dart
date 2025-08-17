import 'package:bloc_flutter/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    _counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _counterBloc,
      child: Scaffold(
        appBar: AppBar(title: Text("Counter")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // only this will be rebuild when the state changes
            // BlocBuilder listens to the CounterBloc and rebuilds when the state changes
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) =>
                  previous.counterValue != current.counterValue,
              builder: (context, state) {
                return Center(
                  child: Text(
                    state.counterValue.toString(),
                    style: TextStyle(fontSize: 60),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(IncrementCounter());
                      },
                      child: Text("Increment"),
                    );
                  },
                ),
                SizedBox(width: 20),
                BlocBuilder<CounterBloc, CounterState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(DecrementCounter());
                      },
                      child: Text("Decrement"),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
