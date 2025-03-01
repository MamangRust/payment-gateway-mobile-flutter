import 'package:mobile/model/card/year_amount_transaction.dart';

class ApiResponseYearlyTransactionAmount {
  final String status;
  final String message;
  final List<CardYearlyTransactionAmount>? data;

  ApiResponseYearlyTransactionAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseYearlyTransactionAmount.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseYearlyTransactionAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardYearlyTransactionAmount.fromJson(item))
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
