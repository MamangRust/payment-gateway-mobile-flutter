class WithdrawYearlyAmount {
  final String year;
  final double totalAmount;

  WithdrawYearlyAmount({
    required this.year,
    required this.totalAmount,
  });

  factory WithdrawYearlyAmount.fromJson(Map<String, dynamic> json) {
    return WithdrawYearlyAmount(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
    };
  }
}
