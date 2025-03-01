import 'package:mobile/model/transfer/year_success.dart';

class ApiResponseTransferYearStatusSuccess {
  final String status;
  final String message;
  final List<TransferYearStatusSuccess> data;

  ApiResponseTransferYearStatusSuccess(
      {required this.status, required this.message, required this.data});

  factory ApiResponseTransferYearStatusSuccess.fromJson(
      Map<String, dynamic> json) {
    return ApiResponseTransferYearStatusSuccess(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => TransferYearStatusSuccess.fromJson(item))
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
