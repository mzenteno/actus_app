import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seguromedico/core/storage/secure_storage.dart';

class SecureStorageImpl implements SecureStorage {
  static const _tokenKey = 'auth_token';
  final FlutterSecureStorage _storage;

  SecureStorageImpl() : _storage = const FlutterSecureStorage();

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }
}
