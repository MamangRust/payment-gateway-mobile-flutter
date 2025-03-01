import 'package:mobile/model/withdraw/month_failed.dart';

class ApiResponseWithdrawMonthStatusFailed {
  final String status;
  final String message;
  final List<WithdrawMonthStatusFailed> data;

  ApiResponseWithdrawMonthStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawMonthStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseWithdrawMonthStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawMonthStatusFailed.fromJson(item))
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
