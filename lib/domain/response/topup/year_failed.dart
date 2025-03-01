import 'package:mobile/model/topup/year_failed.dart';

class ApiResponseTopupYearStatusFailed {
  final String status;
  final String message;
  final List<TopupYearStatusFailed> data;

  ApiResponseTopupYearStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupYearStatusFailed.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopupYearStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupYearStatusFailed.fromJson(item))
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
