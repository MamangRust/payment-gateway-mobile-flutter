import 'package:mobile/model/transaction/month_amount.dart';

class ApiResponseTransactionMonthAmount {
  final String status;
  final String message;
  final List<TransactionMonthAmount> data;

  ApiResponseTransactionMonthAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionMonthAmount.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionMonthAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionMonthAmount.fromJson(item))
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
