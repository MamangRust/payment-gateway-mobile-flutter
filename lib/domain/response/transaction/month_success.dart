import 'package:mobile/model/transaction/month_success.dart';

class ApiResponseTransactionMonthStatusSuccess {
  final String status;
  final String message;
  final List<TransactionMonthStatusSuccess> data;

  ApiResponseTransactionMonthStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionMonthStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionMonthStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionMonthStatusSuccess.fromJson(item))
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
