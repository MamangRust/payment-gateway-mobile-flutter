import 'package:mobile/model/withdraw/withdraw.dart';

class ApiResponseWithdraw {
  final String status;
  final String message;
  final Withdraw? data;

  ApiResponseWithdraw({required this.status, required this.message, this.data});

  factory ApiResponseWithdraw.fromJson(Map<String, dynamic> json) {
    return ApiResponseWithdraw(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Withdraw.fromJson(json['data']) : null,
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
