import 'package:mobile/model/transaction/month_failed.dart';

class ApiResponseTransactionMonthStatusFailed {
  final String status;
  final String message;
  final List<TransactionMonthStatusFailed> data;

  ApiResponseTransactionMonthStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionMonthStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionMonthStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionMonthStatusFailed.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}
