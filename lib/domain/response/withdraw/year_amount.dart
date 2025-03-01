import 'package:mobile/model/withdraw/year_amount.dart';

class ApiResponseWithdrawYearAmount {
  final String status;
  final String message;
  final List<WithdrawYearlyAmount> data;

  ApiResponseWithdrawYearAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawYearAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseWithdrawYearAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawYearlyAmount.fromJson(item))
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
