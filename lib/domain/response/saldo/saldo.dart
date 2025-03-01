import 'package:mobile/model/saldo/saldo.dart';

class ApiResponseSaldo {
  final String status;
  final String message;
  final Saldo? data;

  ApiResponseSaldo({required this.status, required this.message, this.data});

  factory ApiResponseSaldo.fromJson(Map<String, dynamic> json) {
    return ApiResponseSaldo(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Saldo.fromJson(json['data']) : null,
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
