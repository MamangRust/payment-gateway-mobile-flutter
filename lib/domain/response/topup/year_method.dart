import 'package:mobile/model/topup/year_method.dart';

class ApiResponseTopupYearMethod {
  final String status;
  final String message;
  final List<TopupYearlyMethod> data;

  ApiResponseTopupYearMethod(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupYearMethod.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopupYearMethod(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupYearlyMethod.fromJson(item))
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
