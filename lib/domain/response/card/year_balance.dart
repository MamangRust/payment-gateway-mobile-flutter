class ApiResponseYearlyBalance<T> {
  final String status;
  final String message;
  final List<T>? data;

  ApiResponseYearlyBalance(
      {required this.status, required this.message, this.data});

  factory ApiResponseYearlyBalance.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ApiResponseYearlyBalance<T>(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? (json['data'] as List).map((item) => fromJsonT(item)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) {
    return {
      'status': status,
      'message': message,
      'data': data?.map((item) => toJsonT(item)).toList(),
    };
  }
}
