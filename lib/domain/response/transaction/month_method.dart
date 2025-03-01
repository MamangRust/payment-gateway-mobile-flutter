import 'package:mobile/model/transaction/month_method.dart';

class ApiResponseTransactionMonthMethod {
  final String status;
  final String message;
  final List<TransactionMonthMethod> data;

  ApiResponseTransactionMonthMethod(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionMonthMethod.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionMonthMethod(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionMonthMethod.fromJson(item))
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
