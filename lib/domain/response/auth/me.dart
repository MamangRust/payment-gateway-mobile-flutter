import 'package:mobile/model/user/user.dart';

class ApiResponseGetMe {
  final String status;
  final String message;
  final User? data;

  ApiResponseGetMe({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponseGetMe.fromJson(Map<String, dynamic> json) {
    return ApiResponseGetMe(
      status: json['status'] ?? '',
      message: json['message'] ?? json['messsage'] ?? '',
      data: json['data'] != null ? User.fromJson(json['data']) : null,
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
