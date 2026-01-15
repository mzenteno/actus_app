import 'package:json_annotation/json_annotation.dart';
import 'package:seguromedico/features/auth/data/models/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  @JsonKey(name: 'success')
  final bool success;

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'timestamp')
  final String timestamp;

  @JsonKey(name: 'data')
  final AuthData data;

  AuthResponse({
    required this.success,
    required this.message,
    required this.timestamp,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class AuthData {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'user')
  final UserModel user;

  AuthData({
    required this.token,
    required this.user,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
