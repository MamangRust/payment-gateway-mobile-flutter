import 'package:mobile/model/transfer/transfer.dart';

class ApiResponseTransfer {
  final String status;
  final String message;
  final Transfer? data;

  ApiResponseTransfer({required this.status, required this.message, this.data});

  factory ApiResponseTransfer.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransfer(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Transfer.fromJson(json['data']) : null,
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
