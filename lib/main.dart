import 'package:bloc_flutter/counter/bloc/counter_bloc.dart';
import 'package:bloc_flutter/switch_app/bloc/switch_bloc.dart';
import 'package:bloc_flutter/switch_app/view/switch_view.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Bloc Learning',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SwitchView(),
      ),
    );
  }
}
