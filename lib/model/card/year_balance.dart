class CardYearlyBalance {
  final String year;
  final double totalBalance;

  CardYearlyBalance({required this.year, required this.totalBalance});

  factory CardYearlyBalance.fromJson(Map<String, dynamic> json) {
    return CardYearlyBalance(
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
