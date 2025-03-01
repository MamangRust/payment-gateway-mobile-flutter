import 'package:mobile/model/transaction/year_method.dart';

class ApiResponseTransactionYearMethod {
  final String status;
  final String message;
  final List<TransactionYearMethod> data;

  ApiResponseTransactionYearMethod(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransactionYearMethod.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransactionYearMethod(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransactionYearMethod.fromJson(item))
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
