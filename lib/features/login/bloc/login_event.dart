part of 'login_bloc.dart';

sealed class LoginEvent {
}

final class LoginStarted extends LoginEvent {
  final BuildContext context;
  LoginStarted({required this.context});
}

final class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginButtonPressed({required this.email, required this.password, required this.context});
}
