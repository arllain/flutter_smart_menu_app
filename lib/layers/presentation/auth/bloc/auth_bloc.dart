import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_menu_app/core/error/failure_message.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';
import 'package:smart_menu_app/layers/domain/usecases/params/no_params.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/get_current_user_usecase/get_current_user_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_in_usecase/user_sign_in_usecase.dart';
import 'package:smart_menu_app/layers/domain/usecases/user/user_sign_out_usecase/user_sign_out_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final UserSignInUseCase userSignInUseCase;
  final UserSignOutUseCase userSignOutUseCase;

  AuthBloc({
    required this.getCurrentUserUseCase,
    required this.userSignInUseCase,
    required this.userSignOutUseCase,
  }) : super(const AuthState()) {
    on<GetCurrentUserEvent>(_mapGetCurrentUserEventToState);
    on<UserSignInEvent>(_mapUserSignInEventToState);
    on<UserSignOutEvent>(_mapUserSignOutEventToState);
  }

  void _mapGetCurrentUserEventToState(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.initial));
    emit(state.copyWith(status: AuthStatus.loading));
    final failureOrUser = await getCurrentUserUseCase(NoParams());

    failureOrUser.fold(
      (failure) => emit(
        state.copyWith(
          user: null,
          status: AuthStatus.error,
          message: FailureMessage.mapFailureToMessage(failure),
        ),
      ),
      (user) => emit(
        state.copyWith(
          user: user,
          status: AuthStatus.success,
        ),
      ),
    );
  }

  void _mapUserSignInEventToState(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final failureOrUser = await userSignInUseCase(NoParams());

    failureOrUser.fold(
      (failure) => emit(
        state.copyWith(
          user: null,
          status: AuthStatus.error,
          message: FailureMessage.mapFailureToMessage(failure),
        ),
      ),
      (user) => emit(
        state.copyWith(
          user: user,
          status: AuthStatus.success,
        ),
      ),
    );
  }

  void _mapUserSignOutEventToState(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    final failureOrUserLogout = await userSignOutUseCase(NoParams());
    emit(state.copyWith(user: null, status: AuthStatus.success));

    failureOrUserLogout.fold(
      (failure) => emit(
        state.copyWith(
          user: null,
          status: AuthStatus.error,
          message: FailureMessage.mapFailureToMessage(failure),
        ),
      ),
      (userLogout) => emit(
        state.copyWith(
          user: null,
          status: AuthStatus.success,
        ),
      ),
    );
  }
}
