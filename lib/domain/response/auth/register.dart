class ApiResponseRegister<T> {
  final String status;
  final String message;
  final T? data;

  ApiResponseRegister({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponseRegister.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResponseRegister<T>(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data != null ? toJsonT(data!) : null,
    };
  }
}
