import 'package:mobile/model/withdraw/year_success.dart';

class ApiResponseWithdrawYearStatusSuccess {
  final String status;
  final String message;
  final List<WithdrawYearStatusSuccess> data;

  ApiResponseWithdrawYearStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseWithdrawYearStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseWithdrawYearStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => WithdrawYearStatusSuccess.fromJson(item))
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
