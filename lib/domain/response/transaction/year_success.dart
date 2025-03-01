import 'package:mobile/model/transaction/year_success.dart';

class ApiResponseTransactionYearStatusSuccess {
  final String status;
  final String message;
  final List<TransactionYearStatusSuccess> data;

  ApiResponseTransactionYearStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionYearStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransactionYearStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionYearStatusSuccess.fromJson(item))
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
