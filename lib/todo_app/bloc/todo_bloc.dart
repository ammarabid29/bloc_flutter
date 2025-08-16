import 'package:bloc/bloc.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_event.dart';
import 'package:bloc_flutter/todo_app/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    final currentState = state;
    final updatedTodosList = [...currentState.todosList, event.todo];
    emit(currentState.copyWith(todosList: updatedTodosList));
  }

  void _removeTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    final currentState = state;
    final updatedTodosList = List<String>.from(currentState.todosList)
      ..remove(event.todo);
    emit(currentState.copyWith(todosList: updatedTodosList));
  }
}
