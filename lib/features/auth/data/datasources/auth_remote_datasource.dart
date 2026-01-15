import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:seguromedico/features/auth/data/models/auth_response.dart';

part 'auth_remote_datasource.g.dart';

@RestApi(baseUrl: "/auth")
abstract class AuthRemoteDataSource {
  factory AuthRemoteDataSource(Dio dio) = _AuthRemoteDataSource;

  @POST("/login")
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST("/register")
  Future<AuthResponse> register(@Body() Map<String, dynamic> body);
}
