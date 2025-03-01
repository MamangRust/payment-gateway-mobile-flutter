import 'package:mobile/domain/response/auth/token.dart';

class ApiResponseRefreshToken {
  final String status;
  final String message;
  final TokenResponse? data;

  ApiResponseRefreshToken({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponseRefreshToken.fromJson(Map<String, dynamic> json) {
    return ApiResponseRefreshToken(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? TokenResponse.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
