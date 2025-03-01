import 'package:mobile/model/user/user.dart';

class ApiResponseRegister<T> {
  final String status;
  final String message;
  final User? data;

  ApiResponseRegister({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponseRegister.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponseRegister<T>(
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
