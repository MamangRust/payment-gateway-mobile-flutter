import 'package:mobile/model/withdraw/year_failed.dart';

class ApiResponseWithdrawYearStatusFailed {
  final String status;
  final String message;
  final List<WithdrawYearStatusFailed> data;

  ApiResponseWithdrawYearStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawYearStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseWithdrawYearStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawYearStatusFailed.fromJson(item))
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
