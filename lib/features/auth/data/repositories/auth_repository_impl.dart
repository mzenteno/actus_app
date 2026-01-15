import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:seguromedico/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:seguromedico/features/auth/domain/entities/auth_session.dart';
import 'package:seguromedico/features/auth/domain/entities/user.dart';
import 'package:seguromedico/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SharedPreferences prefs;

  AuthRepositoryImpl({required this.remoteDataSource, required this.prefs});

  @override
  Future<Either<String, AuthSession>> login(
      String email, String password) async {
    try {
      final response = await remoteDataSource.login({
        "email": email,
        "password": password,
      });

      if (!response.success) {
        return Left(response.message);
      }

      final User user = response.data.user.toDomain();

      final session = AuthSession(token: response.data.token, user: user);

      await _saveSession(session);

      return Right(session);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> logout() {
    throw UnimplementedError();
  }

  Future<void> _saveSession(AuthSession session) async {
    await prefs.setString('auth_token', session.token);
    await prefs.setString(
        'user_data',
        jsonEncode({
          'id': session.user.id,
          'name': session.user.name,
          'email': session.user.email,
          'role': session.user.role,
        }));
  }
}
