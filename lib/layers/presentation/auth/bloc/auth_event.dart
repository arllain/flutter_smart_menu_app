part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentUserEvent extends AuthEvent {}

class AuthStarted extends AuthEvent {
  @override
  List<Object> get props => [];
}

class UserSignOutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class UserSignInEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
