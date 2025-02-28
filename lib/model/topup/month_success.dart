class TopupMonthStatusSuccess {
  final String year;
  final String month;
  final double totalAmount;
  final int totalSuccess;

  TopupMonthStatusSuccess({
    required this.year,
    required this.month,
    required this.totalAmount,
    required this.totalSuccess,
  });

  factory TopupMonthStatusSuccess.fromJson(Map<String, dynamic> json) {
    return TopupMonthStatusSuccess(
      year: json['year'],
      month: json['month'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalSuccess: json['total_success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'month': month,
      'total_amount': totalAmount,
      'total_success': totalSuccess,
    };
  }
}
