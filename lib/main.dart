import 'package:bloc_flutter/counter/bloc/counter_bloc.dart';
import 'package:bloc_flutter/counter/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Bloc Learning',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const CounterView(),
      ),
    );
  }
}
