import 'package:bloc_flutter/auth/login/view/login_view.dart';
import 'package:bloc_flutter/favorite_app/bloc/items_bloc.dart';
import 'package:bloc_flutter/post_app/bloc/post_bloc.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_bloc.dart';
import 'package:bloc_flutter/utils/image_picker_utils.dart';
import 'package:bloc_flutter/image_picker/bloc/image_picker_bloc.dart';
import 'package:bloc_flutter/switch_app/bloc/switch_bloc.dart';
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
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => ItemsBloc()),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(title: 'Bloc Learning', home: const LoginView()),
    );
  }
}
