import 'package:mobile/model/transfer/month_amount.dart';

class ApiResponseTransferMonthAmount {
  final String status;
  final String message;
  final List<TransferMonthAmount> data;

  ApiResponseTransferMonthAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferMonthAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransferMonthAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferMonthAmount.fromJson(item))
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
