import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:seguromedico/features/auth/domain/entities/auth_session.dart';
import 'package:seguromedico/features/auth/domain/usecases/login_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final Either<String, AuthSession> result = await loginUseCase(
        event.email,
        event.password,
      );
      result.fold(
        (failure) => emit(AuthFailure(failure)),
        (session) => emit(AuthSuccess(session.user)),
      );
    });
  }
}
