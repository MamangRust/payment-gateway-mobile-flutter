import 'package:mobile/model/card/year_amount_withdraw.dart';

class ApiResponseYearlyWithdrawAmount {
  final String status;
  final String message;
  final List<CardYearlyWithdrawAmount>? data;

  ApiResponseYearlyWithdrawAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseYearlyWithdrawAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseYearlyWithdrawAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardYearlyWithdrawAmount.fromJson(item))
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
