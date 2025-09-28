part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class loginRequested extends LoginEvent {
  final String phoneNumber;
  final String occupation;
  final String name;

  loginRequested({
    required this.phoneNumber,
    required this.occupation,
    required this.name,
  });
}

class checkLoginStatus extends LoginEvent {}

class logoutRequested extends LoginEvent {}
