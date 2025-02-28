class TransferYearStatusSuccess {
  final String year;
  final double totalAmount;
  final int totalSuccess;

  TransferYearStatusSuccess({
    required this.year,
    required this.totalAmount,
    required this.totalSuccess,
  });

  factory TransferYearStatusSuccess.fromJson(Map<String, dynamic> json) {
    return TransferYearStatusSuccess(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
      totalSuccess: json['total_success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
      'total_success': totalSuccess,
    };
  }
}
