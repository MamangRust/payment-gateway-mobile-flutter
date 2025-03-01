import 'package:mobile/model/card/month_amount_transfer.dart';

class ApiResponseMonthlyTransferAmount {
  final String status;
  final String message;
  final List<CardMonthTransferAmount>? data;

  ApiResponseMonthlyTransferAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseMonthlyTransferAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseMonthlyTransferAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardMonthTransferAmount.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}
