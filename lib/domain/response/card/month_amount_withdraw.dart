import 'package:mobile/model/card/month_amount_withdraw.dart';

class ApiResponseMonthlyWithdrawAmount {
  final String status;
  final String message;
  final List<CardMonthWithdrawAmount>? data;

  ApiResponseMonthlyWithdrawAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseMonthlyWithdrawAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseMonthlyWithdrawAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardMonthWithdrawAmount.fromJson(item))
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
