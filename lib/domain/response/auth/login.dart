import 'package:mobile/domain/response/auth/token.dart';

class ApiResponseLogin {
  final String status;
  final String message;
  final TokenResponse? data;

  ApiResponseLogin({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponseLogin.fromJson(Map<String, dynamic> json) {
    return ApiResponseLogin(
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
