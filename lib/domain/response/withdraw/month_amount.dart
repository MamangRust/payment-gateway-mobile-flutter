import 'package:mobile/model/withdraw/month_amount.dart';

class ApiResponseWithdrawMonthAmount {
  final String status;
  final String message;
  final List<WithdrawMonthlyAmount> data;

  ApiResponseWithdrawMonthAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawMonthAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseWithdrawMonthAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawMonthlyAmount.fromJson(item))
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
