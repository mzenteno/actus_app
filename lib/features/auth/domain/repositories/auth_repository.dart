import 'package:dartz/dartz.dart';
import 'package:seguromedico/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<String, AuthSession>> login(String email, String password);
  Future<Either<String, void>> logout();
}
