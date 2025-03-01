import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/domain/requests/auth/login.dart';
import 'package:mobile/domain/requests/auth/register.dart';
import 'package:mobile/domain/response/auth/login.dart';
import 'package:mobile/domain/response/auth/me.dart';
import 'package:mobile/domain/response/auth/refresh_token.dart';
import 'package:mobile/domain/response/auth/register.dart';

class AuthService {
  final Dio _dio;

  AuthService(this._dio);

  Future<ApiResponseLogin> login(LoginRequest req) async {
    try {
      final response = await _dio.post("/auth/login", data: req.toJson());

      print("Login response: ${response.data}");
      return ApiResponseLogin.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Login failed.");
    }
  }

  Future<ApiResponseRegister> register(RegisterRequest req) async {
    try {
      final response = await _dio.post("/auth/register", data: req.toJson());
      return ApiResponseRegister.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data["message"] ?? "Registration failed.");
    }
  }

  Future<ApiResponseGetMe> getMe(String accessToken) async {
    try {
      final response = await _dio.get("/auth/me",
          options: Options(
            headers: {"Authorization": "Bearer $accessToken"},
          ));
      return ApiResponseGetMe.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          e.response?.data["message"] ?? "Failed to fetch user data.");
    }
  }

  Future<ApiResponseRefreshToken> refreshAccessToken(
      String accessToken, String refreshToken) async {
    try {
      final response = await _dio.post(
        "/auth/refresh-token",
        data: {"refresh_token": refreshToken},
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );
      return ApiResponseRefreshToken.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
          e.response?.data["message"] ?? "Failed to refresh access token.");
    }
  }
}

final dioProvider =
    Provider((ref) => Dio(BaseOptions(baseUrl: "http://localhost:5000/api")));
final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(dioProvider)));
