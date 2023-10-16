import 'package:bloc/bloc.dart';
import 'package:flutter_register_form/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<UserRegisterEvent>((event, emit) async {
      emit(Loading());

      bool isSuccess = await authRepository.registerUser(
        name: event.name,
        phoneNumber: event.phoneNumber,
        email: event.email,
        country: event.country,
        lifeHistory: event.lifeHistory,
        password: event.password,
      );

      if (isSuccess) {
        emit(Registered());
      } else {
        emit(Error(message: "Ошибка при регистрации."));
      }
    });
  }
}
