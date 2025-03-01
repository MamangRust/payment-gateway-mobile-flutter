import 'package:mobile/model/card/dashboard_card_number.dart';

class ApiResponseDashboardCardNumber {
  final String status;
  final String message;
  final DashboardCardCardNumber? data;

  ApiResponseDashboardCardNumber(
      {required this.status, required this.message, this.data});

  factory ApiResponseDashboardCardNumber.fromJson(Map<String, dynamic> json) {
    return ApiResponseDashboardCardNumber(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? DashboardCardCardNumber.fromJson(json['data'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
