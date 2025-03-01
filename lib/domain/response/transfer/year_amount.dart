import 'package:mobile/model/transfer/year_amount.dart';

class ApiResponseTransferYearAmount {
  final String status;
  final String message;
  final List<TransferYearAmount> data;

  ApiResponseTransferYearAmount(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferYearAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseTransferYearAmount(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferYearAmount.fromJson(item))
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
