import 'package:mobile/model/user/user.dart';

class ApiResponseUser {
  final String status;
  final String message;
  final User? data;

  ApiResponseUser({required this.status, required this.message, this.data});

  factory ApiResponseUser.fromJson(Map<String, dynamic> json) {
    return ApiResponseUser(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? User.fromJson(json['data']) : null,
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
