import 'package:mobile/model/saldo/month_total_balance.dart';

class ApiResponseMonthTotalSaldo {
  final String status;
  final String message;
  final List<SaldoMonthTotalBalance> data;

  ApiResponseMonthTotalSaldo(
      {required this.status, required this.message, required this.data});

  factory ApiResponseMonthTotalSaldo.fromJson(Map<String, dynamic> json) {
    return ApiResponseMonthTotalSaldo(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => SaldoMonthTotalBalance.fromJson(item))
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
