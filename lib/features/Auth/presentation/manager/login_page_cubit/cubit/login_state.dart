part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginInLoading extends LoginState {}

final class LoginInSuccess extends LoginState {}

final class LoginInFailure extends LoginState {
  final String message;
  LoginInFailure(this.message);
}
