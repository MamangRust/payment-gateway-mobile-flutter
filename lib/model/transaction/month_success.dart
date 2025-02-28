class TransactionMonthStatusSuccess {
  final String year;
  final String month;
  final double totalAmount;
  final int totalSuccess;

  TransactionMonthStatusSuccess({
    required this.year,
    required this.month,
    required this.totalAmount,
    required this.totalSuccess,
  });

  factory TransactionMonthStatusSuccess.fromJson(Map<String, dynamic> json) {
    return TransactionMonthStatusSuccess(
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
