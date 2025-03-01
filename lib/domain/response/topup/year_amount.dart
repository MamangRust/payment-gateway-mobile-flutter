import 'package:mobile/model/topup/year_amount.dart';

class ApiResponseTopupYearAmount {
  final String status;
  final String message;
  final List<TopupYearlyAmount> data;

  ApiResponseTopupYearAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTopupYearAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseTopupYearAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TopupYearlyAmount.fromJson(item))
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
