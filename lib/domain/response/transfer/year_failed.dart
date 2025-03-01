import 'package:mobile/model/transfer/year_failed.dart';

class ApiResponseTransferYearStatusFailed {
  final String status;
  final String message;
  final List<TransferYearStatusFailed> data;

  ApiResponseTransferYearStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferYearStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransferYearStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferYearStatusFailed.fromJson(item))
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
