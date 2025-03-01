import 'package:mobile/model/transaction/year_failed.dart';

class ApiResponseTransactionYearStatusFailed {
  final String status;
  final String message;
  final List<TransactionYearStatusFailed> data;

  ApiResponseTransactionYearStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionYearStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionYearStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionYearStatusFailed.fromJson(item))
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
