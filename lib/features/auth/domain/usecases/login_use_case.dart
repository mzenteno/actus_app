import 'package:dartz/dartz.dart';
import 'package:seguromedico/core/storage/secure_storage.dart';
import 'package:seguromedico/features/auth/domain/entities/auth_session.dart';
import 'package:seguromedico/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  final SecureStorage storage;

  LoginUseCase(this.repository, this.storage);

  Future<Either<String, AuthSession>> call(
      String email, String password) async {
    final result = await repository.login(email, password);

    return result.fold((error) => Left(error), (session) async {
      await storage.saveToken(session.token);
      return Right(session);
    });
  }
}
