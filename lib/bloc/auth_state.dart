part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Registered extends AuthState {}

class Error extends AuthState {
  final String message;

  Error({required this.message});
}
