import 'package:mobile/model/transaction/transaction.dart';

class ApiResponseTransaction {
  final String status;
  final String message;
  final Transaction? data;

  ApiResponseTransaction(
      {required this.status, required this.message, this.data});

  factory ApiResponseTransaction.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransaction(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Transaction.fromJson(json['data']) : null,
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
