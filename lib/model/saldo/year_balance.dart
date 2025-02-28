class SaldoYearBalance {
  final String year;
  final double totalBalance;

  SaldoYearBalance({
    required this.year,
    required this.totalBalance,
  });

  factory SaldoYearBalance.fromJson(Map<String, dynamic> json) {
    return SaldoYearBalance(
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
