import 'package:mobile/model/topup/month_success.dart';

class ApiResponseTopupMonthStatusSuccess {
  final String status;
  final String message;
  final List<TopupMonthStatusSuccess> data;

  ApiResponseTopupMonthStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupMonthStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTopupMonthStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupMonthStatusSuccess.fromJson(item))
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
