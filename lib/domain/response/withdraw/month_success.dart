import 'package:mobile/model/withdraw/month_success.dart';

class ApiResponseWithdrawMonthStatusSuccess {
  final String status;
  final String message;
  final List<WithdrawMonthStatusSuccess> data;

  ApiResponseWithdrawMonthStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawMonthStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseWithdrawMonthStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawMonthStatusSuccess.fromJson(item))
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
