import 'package:dartz/dartz.dart';
import 'package:seguromedico/features/auth/domain/entities/auth_session.dart';
import 'package:seguromedico/features/auth/domain/entities/user.dart';
import 'package:seguromedico/features/auth/domain/repositories/auth_repository.dart';

/// Repositorio falso para pruebas y simulación de backend
class FakeAuthRepository implements AuthRepository {
  @override
  Future<Either<String, AuthSession>> login(
      String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email.isEmpty || password.isEmpty) {
      return const Left('Email y contraseña son requeridos');
    }

    if (password.length < 6) {
      return const Left('La contraseña debe tener al menos 6 caracteres');
    }

    // Usuario de prueba
    if (email == 'test@test.com' && password == '123456') {
      final user = User(
        id: 1,
        name: 'marcelo',
        email: email,
        role: 'asegurado',
      );

      final session = AuthSession(
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInJvbGUiOiJhc2VndXJhZG8iLCJpYXQiOjE3MDUyMzQ1NjB9.fake_token_asegurado",
          user: user);

      return Right(session);
    }

    // Doctor de prueba
    if (email == 'doctor@test.com' && password == '123456') {
      final user = User(
        id: 1,
        name: 'Dr. Juan Perez',
        email: email,
        role: 'doctor',
      );

      final session = AuthSession(
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsInJvbGUiOiJhc2VndXJhZG8iLCJpYXQiOjE3MDUyMzQ1NjB9.fake_token_doctor",
          user: user);

      return Right(session);
    }

    return Left('Credenciales inválidas');
  }

  @override
  Future<Either<String, void>> logout() {
    throw UnimplementedError();
  }
}
