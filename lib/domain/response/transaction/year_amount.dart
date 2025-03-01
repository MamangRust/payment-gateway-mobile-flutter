import 'package:mobile/model/transaction/year_amount.dart';

class ApiResponseTransactionYearAmount {
  final String status;
  final String message;
  final List<TransactionYearlyAmount> data;

  ApiResponseTransactionYearAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionYearAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransactionYearAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionYearlyAmount.fromJson(item))
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
