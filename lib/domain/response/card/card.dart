import 'package:mobile/model/card/card.dart';

class ApiResponseCard {
  final String status;
  final String message;
  final Card? data;

  ApiResponseCard({required this.status, required this.message, this.data});

  factory ApiResponseCard.fromJson(Map<String, dynamic> json) {
    return ApiResponseCard(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Card.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}
