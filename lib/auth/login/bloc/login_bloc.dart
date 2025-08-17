import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginSubmittedEvent>(_login);
  }

  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        loginStatus: LoginStatus.initial,
        message: "",
      ),
    );
  }

  void _onPasswordChanged(
    PasswordChangedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        loginStatus: LoginStatus.initial,
        message: "",
      ),
    );
  }

  void _login(LoginEvent event, Emitter<LoginState> emit) async {
    Map data = {"username": state.email, "password": state.password};

    emit(state.copyWith(loginStatus: LoginStatus.loading));

    try {
      final response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            message: "Login successful",
            loginStatus: LoginStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            message: "Login failed",
            loginStatus: LoginStatus.failure,
          ),
        );
      }
    } catch (e) {
      print("Error: $e");
      emit(
        state.copyWith(message: e.toString(), loginStatus: LoginStatus.failure),
      );
    }
  }
}
