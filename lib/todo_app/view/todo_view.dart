import 'package:bloc_flutter/todo_app/bloc/todo_bloc.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_event.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo View")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(child: Text("No Todos available"));
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoBloc>().add(
                        RemoveTodoEvent(todo: state.todosList[index]),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text("Something went wrong"));
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (var i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(todo: "Todo $i"));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
