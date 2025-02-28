class WithdrawYearStatusSuccess {
  final String year;
  final double totalAmount;
  final int totalSuccess;

  WithdrawYearStatusSuccess({
    required this.year,
    required this.totalAmount,
    required this.totalSuccess,
  });

  factory WithdrawYearStatusSuccess.fromJson(Map<String, dynamic> json) {
    return WithdrawYearStatusSuccess(
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
