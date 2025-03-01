import 'package:mobile/model/topup/month_method.dart';

class ApiResponseTopupMonthMethod {
  final String status;
  final String message;
  final List<TopupMonthMethod> data;

  ApiResponseTopupMonthMethod(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupMonthMethod.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopupMonthMethod(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupMonthMethod.fromJson(item))
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
