part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class UserRegisterEvent extends AuthEvent {
  final String name;
  final String phoneNumber;
  final String email;
  final String country;
  final String lifeHistory;
  final String password;

  UserRegisterEvent({
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.country,
    required this.lifeHistory,
    required this.password,
  });
}
