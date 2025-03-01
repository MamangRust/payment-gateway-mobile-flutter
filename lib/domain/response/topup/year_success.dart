import 'package:mobile/model/topup/year_success.dart';

class ApiResponseTopupYearStatusSuccess {
  final String status;
  final String message;
  final List<TopupYearStatusSuccess> data;

  ApiResponseTopupYearStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupYearStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTopupYearStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupYearStatusSuccess.fromJson(item))
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
