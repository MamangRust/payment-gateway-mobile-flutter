import 'package:mobile/model/card/year_amount_transfer.dart';

class ApiResponseYearlyTransferAmount {
  final String status;
  final String message;
  final List<CardYearlyTransferAmount>? data;

  ApiResponseYearlyTransferAmount(
      {required this.status, required this.message, this.data});

  factory ApiResponseYearlyTransferAmount.fromJson(Map<String, dynamic> json) {
    return ApiResponseYearlyTransferAmount(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List)
              .map((item) => CardYearlyTransferAmount.fromJson(item))
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
