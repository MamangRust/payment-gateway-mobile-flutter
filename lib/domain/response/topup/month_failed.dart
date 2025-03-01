import 'package:mobile/model/topup/month_failed.dart';

class ApiResponseTopupMonthStatusFailed {
  final String status;
  final String message;
  final List<TopupMonthStatusFailed> data;

  ApiResponseTopupMonthStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupMonthStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTopupMonthStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupMonthStatusFailed.fromJson(item))
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
