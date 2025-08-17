part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordChangedEvent extends LoginEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginSubmittedEvent extends LoginEvent {}
