class SaldoYearTotalBalance {
  final String year;
  final double totalBalance;

  SaldoYearTotalBalance({
    required this.year,
    required this.totalBalance,
  });

  factory SaldoYearTotalBalance.fromJson(Map<String, dynamic> json) {
    return SaldoYearTotalBalance(
      year: json['year'],
      totalBalance: (json['total_balance'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_balance': totalBalance,
    };
  }
}
