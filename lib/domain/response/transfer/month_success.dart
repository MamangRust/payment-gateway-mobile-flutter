import 'package:mobile/model/transfer/month_success.dart';

class ApiResponseTransferMonthStatusSuccess {
  final String status;
  final String message;
  final List<TransferMonthStatusSuccess> data;

  ApiResponseTransferMonthStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferMonthStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransferMonthStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferMonthStatusSuccess.fromJson(item))
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
