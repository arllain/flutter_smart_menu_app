part of 'auth_bloc.dart';

enum AuthStatus { initial, success, error, loading }

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isSuccess => this == AuthStatus.success;
  bool get isError => this == AuthStatus.error;
  bool get isLoading => this == AuthStatus.loading;
}

class AuthState extends Equatable {
  final UserEntity? user;
  final AuthStatus status;
  final String message;

  const AuthState({
    this.user,
    this.status = AuthStatus.initial,
    this.message = '',
  });

  @override
  List<Object> get props => [status, message];

  AuthState copyWith({
    UserEntity? user,
    AuthStatus? status,
    String? message,
  }) {
    return AuthState(
      user: user,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }
}
