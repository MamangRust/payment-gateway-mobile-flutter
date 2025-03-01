import 'package:mobile/model/card/month_amount_transaction.dart';

class ApiResponseMonthlyTransactionAmount {
  final String status;
  final String message;
  final List<CardMonthTransactionAmount>? data;

  ApiResponseMonthlyTransactionAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseMonthlyTransactionAmount.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseMonthlyTransactionAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardMonthTransactionAmount.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}
