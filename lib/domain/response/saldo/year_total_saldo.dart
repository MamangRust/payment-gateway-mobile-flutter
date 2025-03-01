import 'package:mobile/model/saldo/year_total_balance.dart';

class ApiResponseYearTotalSaldo {
  final String status;
  final String message;
  final List<SaldoYearTotalBalance> data;

  ApiResponseYearTotalSaldo(
      {required this.status, required this.message, required this.data});

  factory ApiResponseYearTotalSaldo.fromJson(Map<String, dynamic> json) {
    return ApiResponseYearTotalSaldo(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => SaldoYearTotalBalance.fromJson(item))
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
