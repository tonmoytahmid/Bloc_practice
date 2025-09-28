import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/features/login/data/login_repository.dart';
import 'package:bloc_practice/features/login/database/login_database.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc(this.loginRepository) : super(LoginInitial()) {
    on<loginRequested>(_onLoginRequested);
    on<checkLoginStatus>(_onLoginCheckStatus);
    on<logoutRequested>(_onLogoutRequested);
  }

  FutureOr<void> _onLoginRequested(
    loginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginRepository.signInWithGoogle(
        name: event.name,
        phoneNumber: event.phoneNumber,
        occupation: event.occupation,
      );
      print("User returned: $user");
      emit(LoginSuccess(user: user!));
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }

  FutureOr<void> _onLoginCheckStatus(
    checkLoginStatus event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final user = await loginRepository.getLoggedInUser();
      if (user != null) {
        emit(LoginSuccess(user: user));
      } else {
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginInitial());
    }
  }

  FutureOr<void> _onLogoutRequested(
    logoutRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      await loginRepository.logout();
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
