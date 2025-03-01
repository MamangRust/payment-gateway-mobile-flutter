import 'package:mobile/model/topup/month_amount.dart';

class ApiResponseTopupMonthAmount {
  final String status;
  final String message;
  final List<TopupMonthAmount> data;

  ApiResponseTopupMonthAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupMonthAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopupMonthAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupMonthAmount.fromJson(item))
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
