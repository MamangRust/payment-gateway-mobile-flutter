import 'package:mobile/model/transfer/month_failed.dart';

class ApiResponseTransferMonthStatusFailed {
  final String status;
  final String message;
  final List<TransferMonthStatusFailed> data;

  ApiResponseTransferMonthStatusFailed(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferMonthStatusFailed.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransferMonthStatusFailed(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferMonthStatusFailed.fromJson(item))
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
