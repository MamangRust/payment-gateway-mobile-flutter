import 'package:mobile/model/topup/topup.dart';

class ApiResponseTopup {
  final String status;
  final String message;
  final Topup? data;

  ApiResponseTopup({required this.status, required this.message, this.data});

  factory ApiResponseTopup.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopup(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Topup.fromJson(json['data']) : null,
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
