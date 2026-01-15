import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:seguromedico/core/storage/secure_storage.dart'; // <- Asegúrate que esta ruta es correcta
import 'package:seguromedico/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:seguromedico/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:seguromedico/features/auth/data/repositories/fake_auth_repository_impl.dart';
import 'package:seguromedico/features/auth/data/repositories/secure_storage_impl.dart';
import 'package:seguromedico/features/auth/domain/repositories/auth_repository.dart';
import 'package:seguromedico/features/auth/domain/usecases/login_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies({bool useFake = false}) async {
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorageImpl());

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  if (!useFake) {
    final dio = Dio(BaseOptions(
      baseUrl: "https://tu-api.com",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ));

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    getIt.registerSingleton<Dio>(dio);

    getIt.registerFactory(() => AuthRemoteDataSource(getIt<Dio>()));
  }

  if (useFake) {
    getIt.registerFactory<AuthRepository>(() => FakeAuthRepository());
  } else {
    getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(
          remoteDataSource: getIt<AuthRemoteDataSource>(),
          prefs: getIt<SharedPreferences>(),
        ));
  }

  getIt.registerFactory(
    () => LoginUseCase(
      getIt<AuthRepository>(),
      getIt<SecureStorage>(),
    ),
  );
}
